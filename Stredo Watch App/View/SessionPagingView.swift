//
//  SessionPagingView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI
import WatchKit
import HealthKit

struct SessionPagingView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    @State private var selection: Tab = .stretch
    @Binding var path: NavigationPath
    enum Tab {
        case controls, stretch
    }
    @Environment(\.isLuminanceReduced) var isLuminanceReduced

    var body: some View {
        TabView(selection: $selection) {
            ExerciseView(path: $path)
                .tag(Tab.stretch)
            ControlsView(path: $path).tag(Tab.controls)
        }
        .navigationBarHidden(true)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .onChange(of: stretchingManager.running) { _ in
            displayStretchView()
        }
        .onChange(of: isLuminanceReduced) { _ in
            displayStretchView()
        }
    }

     func displayStretchView() {
        withAnimation {
            selection = .stretch
        }
    }
}

struct PagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView(path: .constant(NavigationPath())).environmentObject(StretchingManager())
    }
}

