//
//  CountdownView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 23/05/23.
//

import SwiftUI

struct CountdownView: View {
    let date: Date
    @Binding var timeRemaining: Double

    var body: some View {
        Text(formattedTime(timeRemaining))
            .onChange(of: date) { _ in
                if timeRemaining > -1 {
                    timeRemaining -= 1
                }
            }
    }

    private func formattedTime(_ time: Double) -> String {
        let seconds = Int(max(time, 0)) % 60
        return String(format: "%01d", seconds)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(date: Date(), timeRemaining: .constant(3))
    }
}
