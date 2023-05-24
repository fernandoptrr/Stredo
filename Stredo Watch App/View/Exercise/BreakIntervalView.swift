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
                        .font(FontProvider.custom(.nunito, size: 48))
                        .padding(.horizontal)
                        Text("s")
                            .font(FontProvider.custom(.nunito, size: .title2, style: .title2))
                            .offset(x: -4, y: 6)
                    }
                    Spacer()
                    Text("Next")
                        .font(FontProvider.custom(.nunito, size: .caption, style: .caption))
                    Text(message)
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
        BreakIntervalView(showBreak: .constant(true), message: "Sittingleft neck Stretch")
            .environmentObject(StretchingManager())
    }
}


