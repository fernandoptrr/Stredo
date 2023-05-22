//
//  TimerView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI

struct TimerView: View {
    @State private var completionAmount = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        RoundedRectangle(cornerRadius: 35, style: .continuous)
            .trim(from: 0.0, to: completionAmount)
            .stroke(Color.green, lineWidth: 4)
            .rotationEffect(Angle(degrees: 180))
            .onReceive(timer) { _ in
                withAnimation {
                    if completionAmount >= 1 {
                        completionAmount = 0
                    } else {
                        completionAmount += 0.1
                    }
                }
            }
                .edgesIgnoringSafeArea(.all)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
            TimerView()
    }
}
