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
    
    func addWorkout() {
        store.workouts.append(Workout(title: "Test"))
    }
    
    var body: some View {
        VStack {
            Text("Add a workout")
                .font(.title)
            
            Spacer()
            
            VStack(spacing: 30) {
                Button(action: { self.addWorkout() }) {
                    Text("Add More Workout")
                        .foregroundColor(.white)
                }
                .modifier(ButtonModifier())
                
                Button(action: {
                    self.addWorkout()
                    self.isPresented = false
                }) {
                    Text("Add Workout & Leave")
                        .foregroundColor(.white)
                }
                .modifier(ButtonModifier())
            }
            .frame(maxWidth: .infinity)
            .offset(y: -30)
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout(store: WorkoutStore(), isPresented: .constant(true))
    }
}
