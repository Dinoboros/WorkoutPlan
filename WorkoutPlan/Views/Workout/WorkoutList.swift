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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.workouts, id: \.id) { workout in
                    NavigationLink(destination: WorkoutDetail(workout: workout)) {
                        HStack {
                            Image(systemName: "pencil.slash")
                            Text(workout.title)
                        }
                    }
                }.onDelete { index in
                    self.store.workouts.remove(at: index.first!)
                }
            }
            .navigationBarTitle(Text("Workouts"))
            .navigationBarItems(trailing: Button(action: { self.showAddWorkout.toggle() }) {
                Text("Add workout")
            }.sheet(isPresented: $showAddWorkout) {
                AddWorkout(store: self.store, isPresented: self.$showAddWorkout)
            })
        }
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList()
    }
}
