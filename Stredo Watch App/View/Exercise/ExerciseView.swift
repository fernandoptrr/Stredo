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
                ExerciseImageView(images: exercise.images)
                    .offset(y: -4)
                VStack {
                    ExerciseMetricsView(timeRemaining: $timeRemaining, index: index, date: context.date)
                        .padding(1)
                    Spacer()
                    Text(exercise.desc)
                        .font(FontProvider.custom(.nunito, size: .subheadline, style: .subheadline))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .offset(y: 10)
                }
                .foregroundColor(Color("DarkGreenColor"))
                TimerProggresView(timeRemaining: $timeRemaining, duration: exercise.duration, color: Color("LightOrangeColor"))
            }
        }
        .foregroundColor(.black)
        .background(Color("CreamColor"))
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: .constant(0), timeRemaining: .constant(5))
            .environmentObject(StretchingManager())
    }
}
