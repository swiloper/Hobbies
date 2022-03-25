//
//  Hobbies.swift
//  Hobbies
//
//  Created by myronishyn.ihor on 25.03.2022.
//

import Foundation

struct Hobby {
    let title: String
    var isSelected: Bool = false
}

struct HobbiesData {
    static var hobbies = [
        Hobby(title: "Skateboarding"),
        Hobby(title: "Golf"),
        Hobby(title: "Karate"),
        Hobby(title: "Running"),
        Hobby(title: "Soccer"),
        Hobby(title: "Volleyball"),
        Hobby(title: "Swimming"),
        Hobby(title: "Hiking"),
        Hobby(title: "Bowling"),
        Hobby(title: "Baseball"),
        Hobby(title: "Gymnastics"),
        Hobby(title: "Basketball"),
        Hobby(title: "Kickboxing"),
        Hobby(title: "Snowboarding"),
        Hobby(title: "Rock climbing"),
        Hobby(title: "Gardening"),
        Hobby(title: "Fishing"),
        Hobby(title: "Roller skating")
    ]
}
