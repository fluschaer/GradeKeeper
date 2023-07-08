//
//  ContentView.swift
//  SwiftDataTest
//
//  Created by Flurin Schaer on 06.07.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var years: [GradeKeeperData]
    @State var courses: YearData
    
    @State private var showAddDialog = false
    @State private var newYear = ""
    
    var body: some View {
        NavigationStack {
            Group {
                if years.isEmpty  {
                    ContentUnavailableView("No App Idea", systemImage: "square.stack.3d.up.slash", description: Text("Tap add to create your first app idea"))
                } else {
                    List(years) {
                        GradeKeeperListRow(year: $0)
                    }
                }
            }
            .navigationTitle("GradeKeeper")
            .navigationDestination(for: YearData.self) {
                EditYear(year: $0)
            }
            .toolbar {
                Button() {
                    showAddDialog.toggle()
                } label: {
                    Image(systemName: "plus.app")
                }
            }
            .sheet(isPresented: $showAddDialog) {
                NavigationStack {
                    Form {
                        TextField("Name", text: $newYear)
                    }
                    .navigationTitle("New Semester")
                    .toolbar {
                        Button("Dismiss") {
                            showAddDialog.toggle()
                        }
                        Button("Save") {
                            let year = GradeKeeperData(name: newYear)
                            modelContext.insert(year)
                            showAddDialog.toggle()
                        }
                    }
                }
                .presentationDetents([.medium])
            }
        }
        
    }
}


