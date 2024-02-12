//
//  Event.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import Foundation

struct Event: Identifiable, Codable {
    var id: UUID
    var teamOne: String
    var teamTwo: String
    var teamOneScore: String
    var teamTwoScore: String
    var category: String
    var location: String
    var date: Date
    
    var eventTitle: String {
        return "\(teamOne) VS \(teamTwo)"
    }
    
    init(id: UUID = UUID(), teamOne: String, teamTwo: String, teamOneScore: String, teamTwoScore: String, category: String, location: String, date: Date) {
        self.id = id
        self.teamOne = teamOne
        self.teamTwo = teamTwo
        self.teamOneScore = teamOneScore
        self.teamTwoScore = teamTwoScore
        self.category = category
        self.location = location
        self.date = date
    }
    
    static func getMockData() -> Event {
        Event(
            teamOne: "Toronto",
            teamTwo: "Febers",
            teamOneScore: "0",
            teamTwoScore: "1",
            category: "hockey",
            location: "Sky Arena, Denver",
            date: Date()
        )
    }
}
