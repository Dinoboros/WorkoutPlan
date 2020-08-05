//
//  WorkoutList.swift
//  WorkoutPlan
//
//  Created by Méryl VALIER on 05/08/2020.
//  Copyright © 2020 Méryl VALIER. All rights reserved.
//

import SwiftUI

struct WorkoutList: View {
    @ObservedObject var store = WorkoutStore()
    
    @State var showAddWorkout = false
//    @Binding var showList: Bool
    
    func addWorkout() {
        store.workouts.append(Workout(title: "Nouvelle séance"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.workouts) { workout in
                    NavigationLink(destination: WorkoutDetail()) {
                        HStack {
                            Image(systemName: "pencil.slash")
                            Text(workout.title)
                        }
                    }
                }.onDelete { index in
                    self.store.workouts.remove(at: index.first!)
                }
            }
            .navigationBarTitle(Text("Workout"))
            .navigationBarItems(trailing: Button(action: { self.showAddWorkout.toggle() }) {
                Text("Add workout")
            }.sheet(isPresented: $showAddWorkout) {
                AddWorkout()
            })
        }
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList()
    }
}
