//
//  ControlsView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI

struct ControlsView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @Binding var path: NavigationPath
    @Binding var isPaused: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack(spacing: 16) {
            VStack {
                Button {
                    dismiss()
                    stretchingManager.endWorkout()
                    path.removeLast(path.count)
                } label: {
                    Image(systemName: "xmark")
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkRedColor"))
                }
                .tint(Color("LightRedColor").opacity(10))
                .font(.title3)
                Text("End")
                    .font(FontProvider.custom(.nunito, size: .footnote, style: .footnote))
                    .fontWeight(.medium)
                    .padding(.top, 2)
            }
            VStack {
                Button {
                    stretchingManager.togglePause()
                    isPaused.toggle()
                } label: {
                    Image(systemName: "play")
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGreenColor"))
                }
                .tint(Color("LightGreenColor").opacity(10))
                .font(.title3)
                Text("Resume")
                    .font(FontProvider.custom(.nunito, size: .footnote, style: .footnote))
                    .fontWeight(.medium)
                    .padding(.top, 2)
            }
        }
        .navigationBarHidden(true)
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(path: .constant(NavigationPath()), isPaused: .constant(true)).environmentObject(StretchingManager())
    }
}
