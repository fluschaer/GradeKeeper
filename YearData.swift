//
//  YearData.swift
//  GradeKeeper
//
//  Created by Flurin Schaer on 08.07.2023.
//

import SwiftUI
import SwiftData

@Model
class YearData {
    @Attribute(.unique) var courses: String
    
    init(courses: String) {
        self.courses = courses
    }
}
