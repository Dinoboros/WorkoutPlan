//
//  Workout.swift
//  WorkoutPlan
//
//  Created by Méryl VALIER on 05/08/2020.
//  Copyright © 2020 Méryl VALIER. All rights reserved.
//

import Foundation
import Combine

struct Workout: Identifiable {
    var id = UUID()
    var title: String
    var exercise: ExerciseStore
}

class WorkoutStore: ObservableObject {
    @Published var workouts: [Workout] = []
}
