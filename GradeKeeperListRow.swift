//
//  GradeKeeperListRow.swift
//  GradeKeeper
//
//  Created by Flurin Schaer on 07.07.2023.
//

import SwiftUI


struct GradeKeeperListRow: View {
    @Environment(\.modelContext) private var modelContext
    var year: GradeKeeperData
    
    var body: some View {
        NavigationLink(value: year) {
            VStack(alignment: .leading) {
                Text(year.name)
            }
        }
        .swipeActions {
            Button(role: .destructive) {
                modelContext.delete(year)
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

