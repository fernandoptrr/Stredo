//
//  CountdownView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI
import WatchKit

struct BreakIntervalView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @State private var timeRemaining: TimeInterval
    @Binding var showBreak: Bool
    let exercise: Exercise
    private let duration: TimeInterval = 5

    init(showBreak: Binding<Bool>, exercise: Exercise) {
        self._timeRemaining = State(initialValue: duration)
        self._showBreak = showBreak
        self.exercise = exercise
    }

    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: stretchingManager.session?.state == .paused)
        ) { context in
            ZStack {
                VStack {
                    ExerciseImageView(images: exercise.images, showBackground: false)
                        .padding()
                    Spacer()
                    HStack {
                        Text("Next in")
                        CountdownView(
                            date: context.date,
                            timeRemaining: $timeRemaining)
                        .fontWeight(.medium)
                    }
                    .font(FontProvider.custom(.nunito, size: .caption, style: .caption))
                    Text(exercise.name)
                        .font(FontProvider.custom(.nunito, size: .footnote, style: .footnote))
                        .fontWeight(.semibold)
                        .lineSpacing(2)
                        .multilineTextAlignment(.center)
                        .padding(.top, 2)
                        .padding(.horizontal)
                }
                TimerProggresView(timeRemaining: $timeRemaining, duration: duration, color: Color("DarkGreenColor"))
            }
        }
        .foregroundColor(.black)
        .background(Color("LightGreenColor"))
        .onChange(of: timeRemaining) { _ in
            if timeRemaining < 0 {
                showBreak.toggle()
            }
            else if timeRemaining < 5{
                WKInterfaceDevice.current().play(.notification)
            }
        }
        .navigationBarHidden(true)
    }
}

struct BreakIntervalView_Previews: PreviewProvider {
    static var previews: some View {
        BreakIntervalView(showBreak: .constant(true), exercise: .exercises[0])
            .environmentObject(StretchingManager())
    }
}


