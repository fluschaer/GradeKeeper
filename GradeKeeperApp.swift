//
//  GradeKeeperApp.swift
//  GradeKeeper
//
//  Created by Flurin Schaer on 07.07.2023.
//

import SwiftUI

@main
struct GradeKeeperApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [GradeKeeperData.self, YearData.self])
    }
}
