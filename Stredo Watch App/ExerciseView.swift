//
//  ExerciseView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 23/05/23.
//

import SwiftUI

struct ExerciseView: View {
    let exercises: [Exercise] = Exercise.exercises
    @State private var showBreak = false
    @State private var breakDone = false
    @State private var index: Int = 0
    @State private var timeRemaining: Double = 100
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    init() {
        self._timeRemaining = State(initialValue: exercise.duration + 1)
    }
    
    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining <= 0)) { context in
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
                            Image(systemName: "figure.strengthtraining.functional")
                                .font(.system(size: 54, design: .rounded))
                                .padding()
                            Spacer()
                            Text(exercise.desc)
                                .font(.footnote)
                                .lineSpacing(2)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        TimerProggresView(timeRemaining: $timeRemaining, duration: exercise.duration, color: .yellow)
                    }
                }
                .onChange(of: timeRemaining) { _ in
                    if timeRemaining < 1 {
                        breakDone = false
                        showBreak.toggle()
                    }
                }
                .navigationBarHidden(true)
                .sheet(isPresented: $showBreak, onDismiss: {
                    if lastExercise {
                        // Handle completion of all exercises
                    } else {
                        index += 1
                        timeRemaining = exercise.duration
                    }
                }) {
                    BreakIntervalView(timerDone: $breakDone)
                }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
