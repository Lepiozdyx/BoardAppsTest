//
//  EventsView.swift
//  BoardAppsTest
//
//  Created by Alex on 12.02.2024.
//

import SwiftUI

struct EventsView: View {
    @StateObject var vm = EventsViewModel()
    @State private var isAdding = false
    @State private var showingDetails = false
    @State private var selectedEvent: Event?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                
                if vm.events.isEmpty {
                    EmptyView(
                        title: "No events added",
                        subtitle: "Add an event with the plus icon above"
                    )
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(vm.events) { event in
                                EventsCellView(event: event)
                                    .onTapGesture {
                                        selectedEvent = event
                                        showingDetails.toggle()
                                    }
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                }
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarButtonView(image: .icAdd) {
                        isAdding.toggle()
                    }
                }
            }
            .sheet(isPresented: $isAdding) {
                NavigationView {
                    AddEventView(viewModel: vm)
                }
            }
            .sheet(item: $selectedEvent) { event in
                NavigationView {
                    EventDetailView(event: event) {
                        vm.deleteEvent(event: event)
                    }
                }
            }
        }
    }
}

#Preview {
    EventsView()
        .preferredColorScheme(.dark)
}
