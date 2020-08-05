//
//  AddWorkout.swift
//  WorkoutPlan
//
//  Created by Méryl VALIER on 05/08/2020.
//  Copyright © 2020 Méryl VALIER. All rights reserved.
//

import SwiftUI

struct AddWorkout: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add a workout")
            
            Spacer()
            
            VStack(spacing: 30) {
                Button(action: {print("Add More Workout")}) {
                    Text("Add More Workout")
                        .foregroundColor(.white)
                }
                .modifier(ButtonModifier())
                
                Button(action: {print("Add Workout & Leave")}) {
                    Text("Add Workout & Leave")
                        .foregroundColor(.white)
                }
                .modifier(ButtonModifier())
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout()
    }
}
