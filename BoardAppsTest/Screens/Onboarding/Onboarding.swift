//
//  Onboarding.swift
//  BoardAppsTest
//
//  Created by Alex on 08.02.2024.
//

import Foundation

struct Onboarding {
    var image: String
    var title: String
    var description: String
}

extension Onboarding {
    static func getStep() -> [Onboarding] {
        [
            Onboarding(
                image: "onboarding1",
                title: "App for the journalists",
                description: "Add and manage your articles"
            ),
            Onboarding(
                image: "onboarding2",
                title: "Manage your budget",
                description: "Add your statistics and earn more"
            ),
            Onboarding(
                image: "onboarding3",
                title: "Smart notes",
                description: "Integrated notes to help you in the events"
            )
        ]
    }
}
