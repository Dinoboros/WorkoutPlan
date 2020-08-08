//
//  AddExercise.swift
//  WorkoutPlan
//
//  Created by Méryl VALIER on 08/08/2020.
//  Copyright © 2020 Méryl VALIER. All rights reserved.
//

import SwiftUI

struct AddExercise: View {
    @ObservedObject var store: ExerciseStore
    @Binding var isPresented: Bool
    @State private var exerciseTitle: String = ""
    @State private var nbSeries: String = ""
    @State private var nbRep: String = ""
    
    func addExercise() {
        store.exercises.append(Exercise(title: exerciseTitle, series: nbSeries, reps: nbRep))
    }
    
    var body: some View {
        ZStack {
           NavigationView {
                Form {
                    TextField("Exercise title", text: $exerciseTitle)
                    
                    Section {
                        TextField("Series", text: $nbSeries)
                            .keyboardType(.numberPad)
                        TextField("Reps", text: $nbRep)
                            .keyboardType(.numberPad)
                    }
                    
                    Section {
                        Button(action: {
                            self.addExercise()
                            self.isPresented = false
                        }) {
                            Text("Add Exercise")
                                .foregroundColor(.white)
                        }
                        .modifier(ButtonModifier())
                    }
                }
                .navigationBarTitle("Add exercise")
            }
        }
    }
}

struct AddExercise_Previews: PreviewProvider {
    static var previews: some View {
        AddExercise(store: ExerciseStore(), isPresented: .constant(true))
    }
}
