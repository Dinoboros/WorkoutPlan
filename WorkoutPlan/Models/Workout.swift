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
}

let workoutData: [Workout] = [
    Workout(title: "Haut du corps"),
    Workout(title: "Bas du corps"),
    Workout(title: "Cardio")
]

class WorkoutStore: ObservableObject {
    @Published var workouts: [Workout] = workoutData
}
