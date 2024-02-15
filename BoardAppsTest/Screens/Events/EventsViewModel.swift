//
//  EventsViewModel.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import Foundation

final class EventsViewModel: ObservableObject {
    private enum StorageKeys {
        static let eventsKey = "events"
    }
    
    @Published var events: [Event] = []
    private let storageManager: StorageManager
    
    init(storageManager: StorageManager = StorageManager()) {
        self.storageManager = storageManager
        loadEvent()
    }
    
    func addEvent(teamOne: String, teamTwo: String, teamOneScore: String, teamTwoScore: String, category: String, location: String, date: Date) {
        let newEvent = Event(teamOne: teamOne, teamTwo: teamTwo, teamOneScore: teamOneScore, teamTwoScore: teamTwoScore, category: category, location: location, date: date)
        events.append(newEvent)
        saveEvent()
    }
    
    func deleteEvent(event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events.remove(at: index)
            saveEvent()
        }
    }
    
    private func loadEvent() {
        events = storageManager.load(key: StorageKeys.eventsKey) ?? []
    }
    
    private func saveEvent() {
        storageManager.save(events, key: StorageKeys.eventsKey)
    }
}
