//
//  WorkoutDetail.swift
//  WorkoutPlan
//
//  Created by Méryl VALIER on 05/08/2020.
//  Copyright © 2020 Méryl VALIER. All rights reserved.
//

import SwiftUI

struct WorkoutDetail: View {
    var workout: Workout
    @State var showAddExercise = false
    
    var body: some View {
        List {
            ForEach(workout.exercise.exercises) { exercise in
                VStack(alignment: .leading) {
                    Text(exercise.title)
                    Text("\(exercise.series) x \(exercise.reps)")
                        .font(.caption)
                }
            }
        }
        .navigationBarTitle(workout.title)
        .navigationBarItems(trailing: Button(action: { self.showAddExercise.toggle() }) {
            Text("Add exercise")
        }.sheet(isPresented: $showAddExercise) {
            AddExercise(store: self.workout.exercise, isPresented: self.$showAddExercise)
        })
    
    }
}

struct WorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetail(workout: Workout(title: "Legs", exercise: ExerciseStore()))
    }
}
