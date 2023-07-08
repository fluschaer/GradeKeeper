//
//  YearView.swift
//  GradeKeeper
//
//  Created by Flurin Schaer on 07.07.2023.
//

import SwiftUI
import SwiftData

@Model
class GradeKeeperData {
    @Attribute(.unique) var name: String
    
    init(name: String) {
        self.name = name
    }
    
    
}
