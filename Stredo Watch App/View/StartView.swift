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
        ZStack {
            Image("stretch_bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 164)
                .offset(y: 48)
            VStack {
                Text("Stredo")
                    .font(FontProvider.custom(.nunito, size: .callout))
                    .fontWeight(.bold)
                Text("Elevate your productivity and improve your overall well-being")
                    .font(FontProvider.custom(.nunito, size: .caption2))
                    .multilineTextAlignment(.center)
                    .padding(.top, -1)
                    .padding(.horizontal)
                Spacer()
                Button(action: {
                    path.append("sessionView")
                    stretchingManager.startWorkout(workoutType: workoutType)
                }){
                    Image(systemName: "figure.cooldown")
                }
                .padding(.horizontal, 16)
                .foregroundColor(Color("DarkGreenColor"))
                .tint(Color("MidGreenColor").opacity(10))
                .navigationDestination(for: String.self) { view in
                    if view == "sessionView" {
                        SessionPagingView(path: $path)
                    }
                }
            }

        }
        .scenePadding()
        .foregroundColor(.black)
        .background(Color("CreamColor"))
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
