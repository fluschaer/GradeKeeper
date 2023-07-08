//
//  EditYear.swift
//  GradeKeeper
//
//  Created by Flurin Schaer on 08.07.2023.
//

import SwiftUI

struct EditYear: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var year: GradeKeeperData
    @Bindable var course: YearData
    
    @State private var showAddDialog = false
    @State private var newCourse = ""
    
    var body: some View {
        List {
            NavigationLink(value: course) {
                VStack(alignment: .leading) {
                    Text(course.courses)
                }
            }
        }
        .navigationTitle(year.name)
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
                    TextField("New Course", text: $newCourse)
                }
                .navigationTitle("New Course")
                .toolbar {
                    Button("Dismiss") {
                        showAddDialog.toggle()
                    }
                    Button("Save") {
                        let course = YearData(courses: newCourse)
                        modelContext.insert(course)
                        showAddDialog.toggle()
                    }
                }
            }
        }
    }
}
