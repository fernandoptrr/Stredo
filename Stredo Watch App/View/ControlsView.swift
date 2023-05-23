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
        HStack {
            VStack {
                Button {
                    dismiss()
                    stretchingManager.endWorkout()
                    path.removeLast(path.count)
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(.red)
                .font(.title2)
                Text("End")
            }
            VStack {
                Button {
                    stretchingManager.togglePause()
                    isPaused.toggle()
                } label: {
                    Image(systemName: "play")
                }
                .tint(.yellow)
                .font(.title2)
                Text("Resume")
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
