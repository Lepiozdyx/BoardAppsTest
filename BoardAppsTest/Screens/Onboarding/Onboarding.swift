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
    static let standartStep: [Onboarding] = [
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
    
    static let customStep: [Onboarding] = [
        Onboarding(
            image: "onb1",
            title: "Your bet on the future",
            description: "Explore a lot of great card games"
        ),
        Onboarding(
            image: "onb2",
            title: "Rate us in the AppStore",
            description: "Make the app better"
        ),
        Onboarding(
            image: "onb3",
            title: "Your bet on the future",
            description: "Explore a lot of great card games"
        )
    ]
}
