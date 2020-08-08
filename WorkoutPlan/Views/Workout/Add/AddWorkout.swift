//
//  AddWorkout.swift
//  WorkoutPlan
//
//  Created by Méryl VALIER on 05/08/2020.
//  Copyright © 2020 Méryl VALIER. All rights reserved.
//

import SwiftUI

struct AddWorkout: View {
    @ObservedObject var store: WorkoutStore
    @Binding var isPresented: Bool
    
    @State private var workoutTitle: String = ""
    
    func addWorkout() {
        store.workouts.append(Workout(title: workoutTitle, exercise: ExerciseStore()))
    }
    
    var body: some View {
        ZStack {
           NavigationView {
                Form {
                    TextField("Workout title", text: $workoutTitle)
                    
                    Section {
                        Button(action: {
                            self.addWorkout()
                            self.isPresented = false
                        }) {
                            Text("Add Workout")
                                .foregroundColor(.white)
                        }
                        .modifier(ButtonModifier())
                    }
                }
                .navigationBarTitle("Add workout")
            }
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout(store: WorkoutStore(), isPresented: .constant(true))
    }
}
