//
//  CustomLayout.swift
//  Hobbies
//
//  Created by myronishyn.ihor on 25.03.2022.
//

import UIKit

final class CollectionViewRow {
    /// Single row attributes in CollectionView.
    fileprivate var attributes = [UICollectionViewLayoutAttributes]()
    private var spacing: CGFloat = 0

    init(spacing: CGFloat) {
        self.spacing = spacing
    }

    fileprivate func add(attribute: UICollectionViewLayoutAttributes) {
        attributes.append(attribute)
    }

    /// This property calculates the actual width of each row, using only the item width and the static item spacing.
    private var rowWidth: CGFloat {
        return attributes.reduce(0, { result, attribute -> CGFloat in
            return result + attribute.frame.width
        }) + CGFloat(attributes.count - 1) * spacing
    }

    /// This method updated the X offset of each item with the logic explained above.
    fileprivate func centerLayout(collectionViewWidth: CGFloat) {
        let padding = (collectionViewWidth - rowWidth) / 2
        var offset = padding
        for attribute in attributes {
            attribute.frame.origin.x = offset
            offset += attribute.frame.width + spacing
        }
    }
}

final class CustomLayout: UICollectionViewFlowLayout {
    
    // This method has been overridden to tell the collectionView how to arrange the cells
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // To center the cells, you need to change the standard attributes for each of them
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        var rows = [CollectionViewRow]()
        var currentRowY: CGFloat = -1

        // This loop groups the cells into rows by checking the y-axis offset
        // If the offset is the same, the elements are on the same line, otherwise a new line will start
        for attribute in attributes {
            if currentRowY != attribute.frame.midY {
                currentRowY = attribute.frame.midY
                rows.append(CollectionViewRow(spacing: 10))
            }
            rows.last?.add(attribute: attribute)
        }

        rows.forEach { $0.centerLayout(collectionViewWidth: collectionView?.frame.width ?? 0) }
        return rows.flatMap { $0.attributes }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return super.layoutAttributesForItem(at: indexPath)
    }
}

