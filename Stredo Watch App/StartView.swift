//
//  ContentView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 22/05/23.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var stretchingManager: StretchingManager
    private let workoutType: HKWorkoutActivityType = .cycling
    @Binding  var path: NavigationPath

    var body: some View {
        VStack {
            Text("Stredo")
                .font(.title3)
                .bold()
            Text("Elevate your productivity and improve your overall well-being")
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            HStack(spacing: 32) {
                Button(action: {}){
                    Image(systemName: "play.fill")
                        .foregroundColor(.pink)
                }
                .frame(width: 50)
                .tint(.pink)
                Button(action: {
                    path.append("sessionView")
                }){
                    Image(systemName: "figure.cooldown")
                }
                .frame(width: 50)
                .tint(.yellow)
                .navigationDestination(for: String.self) { view in
                    if view == "sessionView" {
                        SessionPagingView(path: $path)
                    }
                }
            }
        }
        .scenePadding()
        .sheet(isPresented: $stretchingManager.showingSummaryView) {
            SummaryView()
        }
        .navigationBarHidden(true)
        .onAppear {
            stretchingManager.requestAuthorization()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(path: .constant(NavigationPath()))
            .environmentObject(StretchingManager())
    }
}
