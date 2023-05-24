//
//  ExerciseMetricsView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 24/05/23.
//

import SwiftUI

struct ExerciseMetricsView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @Binding var timeRemaining: Double
    let index: Int
    let date: Date
    let exercises: [Exercise] = Exercise.exercises
    var exercise: Exercise {
        Exercise.exercises[index]
    }

    var body: some View {
        HStack(spacing: 8) {
            HStack {
                Image(systemName: "figure.strengthtraining.functional")
                Text("\(index + 1) / \(exercises.count)")
            }
            Divider()
                .frame(width: 1)
                .overlay(Color("DarkGreenColor"))
            HStack {
                Image(systemName: "heart.fill")
                Text(stretchingManager.heartRate.formatted(.number.precision(.fractionLength(0))))
            }
            Divider()
                .frame(width: 1)
                .overlay(Color("DarkGreenColor"))
            HStack {
                Image(systemName: "timer")
                CountdownView(
                    date: date,
                    timeRemaining: $timeRemaining)
                Text("s")
                    .offset(x: -4)
            }
        }
        .font(FontProvider.custom(.nunito, size: .caption2, style: .caption2))
        .fontWeight(.medium)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ExerciseMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseMetricsView(timeRemaining: .constant(5), index: 1, date: Date())
        .environmentObject(StretchingManager())
    }
}
