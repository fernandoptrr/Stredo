//
//  SessionPagingView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI
import WatchKit
import HealthKit

struct SessionPagingView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @State private var showBreak = false
    @State private var isPaused = false
    @State private var index: Int = 0
    @State private var timeRemaining: Double = 100
    @Binding var path: NavigationPath
    let exercises: [Exercise] = Exercise.exercises
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    init(path: Binding<NavigationPath>) {
        self._path = path
        self._timeRemaining = State(initialValue: exercise.duration)
    }

    private func nextExercise() {
        index += 1
        timeRemaining = exercise.duration
    }
    
    var body: some View {
        ZStack {
            if showBreak {
                BreakIntervalView(showBreak: $showBreak, message: exercises[index + 1].name)
                    .transition(.slide)
            } else {
                ExerciseView(index: $index, timeRemaining: $timeRemaining)
                .transition(.slide)
            }
        }
        .animation(.easeInOut, value: showBreak)
        .navigationBarHidden(true)
        .onChange(of: timeRemaining) { _ in
            if timeRemaining < 0 {
                if lastExercise {
                    stretchingManager.endWorkout()
                    path.removeLast(path.count)
                } else {
                    if !lastExercise {
                        showBreak.toggle()
                        timeRemaining = 100
                    }
                }
            }
        }
        .onChange(of: showBreak) { _ in
            if !showBreak {
                nextExercise()
            }
        }
        .onTapGesture {
            stretchingManager.togglePause()
            isPaused.toggle()
        }
        .sheet(isPresented: $isPaused){
            ControlsView(path: $path, isPaused: $isPaused)
        }
    }
}

struct SecondView: View {
    @Binding var showBreak: Bool

    var body: some View {
        Button("Hide Break") {
            showBreak.toggle()
        }
    }
}

struct PagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView(path: .constant(NavigationPath())).environmentObject(StretchingManager())
    }
}

