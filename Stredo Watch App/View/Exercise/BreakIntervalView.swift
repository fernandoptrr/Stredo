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
    let message: String
    private let duration: TimeInterval = 5

    init(showBreak: Binding<Bool>, message: String) {
        self._timeRemaining = State(initialValue: duration)
        self._showBreak = showBreak
        self.message = message
    }

    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: stretchingManager.session?.state == .paused)
        ) { context in
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
                    Text(message)
                        .font(.caption)
                        .lineSpacing(2)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 4)
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
            else {
                WKInterfaceDevice.current().play(.click)
            }
        }
        .navigationBarHidden(true)
    }
}

struct BreakIntervalView_Previews: PreviewProvider {
    static var previews: some View {
        BreakIntervalView(showBreak: .constant(true), message: "Sittingleft neck Stretch")
            .environmentObject(StretchingManager())
    }
}


