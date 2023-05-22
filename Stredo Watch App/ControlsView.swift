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

    var body: some View {
        HStack {
            VStack {
                Button {
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
                } label: {
                    Image(systemName: stretchingManager.running ? "pause" : "play")
                }
                .tint(.yellow)
                .font(.title2)
                Text(stretchingManager.running ? "Pause" : "Resume")
            }
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(path: .constant(NavigationPath())).environmentObject(StretchingManager())
    }
}
