//
//  TimerView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI

import SwiftUI

struct TimerProggresView: View {
    @Binding var timeRemaining: TimeInterval
    let duration: TimeInterval
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 35, style: .continuous)
            .trim(from: 0, to: CGFloat(1 - (timeRemaining / duration)))
            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
            .foregroundColor(color)
            .rotationEffect(.degrees(180))
            .animation(.easeInOut(duration: 1), value: timeRemaining)
            .edgesIgnoringSafeArea(.all)

    }

}

struct TimerProggresView_Previews: PreviewProvider {
    static var previews: some View {
        TimerProggresView(timeRemaining: .constant(3), duration: 5,color: .yellow)
    }
}
