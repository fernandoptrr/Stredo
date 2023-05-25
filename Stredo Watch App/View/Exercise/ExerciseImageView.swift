//
//  ExerciseImageView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 24/05/23.
//

import SwiftUI

struct ExerciseImageView: View {
    let images: [String]
    @State private var index = 0
    var showBackground: Bool = true

    var body: some View {
        ZStack {
            if showBackground {
                Image("stretch_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 110)
            }
            Image(images.count > 1 ? images[index] : images[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 88)
                .offset(y: 6)
                .animation(.easeIn(duration: 0), value: index)
                .onAppear {
                    startImageTimer()
                }
        }
    }

    private func startImageTimer() {
        guard images.count > 1 else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 1.8, repeats: true) { timer in
            withAnimation {
                index = (index + 1) % images.count
            }
        }
    }
}

struct ExerciseImageView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseImageView(images: ["neckRot_1", "neckRot_2"])
    }
}
