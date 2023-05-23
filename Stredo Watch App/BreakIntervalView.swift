//
//  CountdownView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI
import WatchKit

struct BreakIntervalView: View {
    private let duration: TimeInterval = 5
    @State private var timeRemaining: TimeInterval
    @Binding var timerDone: Bool
    @Environment(\.dismiss) var dismiss

    init(timerDone: Binding<Bool>) {
        self._timerDone = timerDone
        self._timeRemaining = State(initialValue: duration)
    }

    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining <= 0)) { context in
                    ZStack {
                        VStack {
                            Spacer()
                            HStack {
                                CountdownView(
                                    date: context.date,
                                timeRemaining: $timeRemaining)
                                .font(.system(size: 48, design: .rounded))
                                .padding(.horizontal)
                                Text("s")
                                    .font(.title2)
                                    .offset(x: -4, y: 6)
                            }
                            Text("Next")
                                .font(.footnote)
                                .padding(.top)
                            Text("Sitting left neck Stretch")
                                .font(.caption)
                                .lineSpacing(2)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 4)
                                .padding(.horizontal)
                        }
                        TimerProggresView(timeRemaining: $timeRemaining, duration: duration, color: .blue)
                    }
                }
                .onChange(of: timeRemaining) { _ in
                    if timeRemaining < 1 {
                        timerDone = true
                        dismiss()
                    }
                    else {
                        WKInterfaceDevice.current().play(.click)
                    }
                }
                .navigationBarHidden(true)
    }
}

struct BreakIntervalView_Previews: PreviewProvider {
    static var previews: some View {
        BreakIntervalView(timerDone: .constant(false))
    }
}


