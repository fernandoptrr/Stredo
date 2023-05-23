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
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .metrics
    @Binding var path: NavigationPath
    private let workoutType: HKWorkoutActivityType = .cycling
    enum Tab {
        case controls, metrics, nowPlaying
    }

    var body: some View {
        TabView(selection: $selection) {
            ControlsView(path: $path).tag(Tab.controls)
            ExerciseView()
                .tag(Tab.metrics)
            NowPlayingView().tag(Tab.nowPlaying)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(selection == .metrics || selection == .nowPlaying)
        
        .onChange(of: stretchingManager.running) { _ in
            displayMetricsView()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        
        .onChange(of: isLuminanceReduced) { _ in
            displayMetricsView()
        }
        .onAppear{
            stretchingManager.startWorkout(workoutType: workoutType)
        }
    }

    private func displayMetricsView() {
        withAnimation {
            selection = .metrics
        }
    }
}

struct PagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView(path: .constant(NavigationPath())).environmentObject(StretchingManager())
    }
}

