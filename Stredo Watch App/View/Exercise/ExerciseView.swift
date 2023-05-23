//
//  ExerciseView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 23/05/23.
//

import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @State private var showBreak = false
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
    
    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: stretchingManager.session?.state == .paused
            )
        ){ context in
            ZStack {
                VStack {
                    HStack(spacing: 16) {
                        Text("\(index + 1) / \(exercises.count)")
                        HStack {
                            CountdownView(
                                date: context.date,
                                timeRemaining: $timeRemaining)
                            Text("s")
                        }
                    }
                    .font(.caption)
                    .padding(.bottom)
                    Spacer()
                    VStack {
                        Image(systemName: "figure.strengthtraining.functional")
                            .font(.system(size: 54, design: .rounded))
                        Text(stretchingManager.heartRate.formatted(.number.precision(.fractionLength(0))) + "💗")
                            .font(.system(size: 12))
                            .padding(.top, 4)
                    }
                    .padding()
                    Spacer()
                    Text(exercise.desc)
                        .font(.system(size: 14))
                        .lineSpacing(2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                TimerProggresView(timeRemaining: $timeRemaining, duration: exercise.duration, color: .yellow)
            }
        }
        .onChange(of: timeRemaining) { _ in
            if timeRemaining < 0 {
                if lastExercise {
                    stretchingManager.endWorkout()
                    path.removeLast(path.count)
                } else {
                    showBreak.toggle()
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showBreak, onDismiss: {
            index += 1
            timeRemaining = exercise.duration + 1
        }) {
            BreakIntervalView()
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(path: .constant(NavigationPath()))
            .environmentObject(StretchingManager())
    }
}
