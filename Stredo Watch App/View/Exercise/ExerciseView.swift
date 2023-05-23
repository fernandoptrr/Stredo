//
//  ExerciseView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 23/05/23.
//

import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @Binding  var index: Int
    @Binding  var timeRemaining: Double
    let exercises: [Exercise] = Exercise.exercises
    var exercise: Exercise {
        Exercise.exercises[index]
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
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: .constant(0), timeRemaining: .constant(5))
            .environmentObject(StretchingManager())
    }
}
