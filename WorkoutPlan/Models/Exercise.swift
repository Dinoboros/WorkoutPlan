//
//  Exercise.swift
//  WorkoutPlan
//
//  Created by Méryl VALIER on 08/08/2020.
//  Copyright © 2020 Méryl VALIER. All rights reserved.
//

import Foundation
import Combine

struct Exercise: Identifiable {
    var id = UUID()
    var title: String
    var series: String
    var reps: String
}

class ExerciseStore: ObservableObject {
    @Published var exercises: [Exercise] = []
}
