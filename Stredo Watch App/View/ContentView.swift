//
//  ContentView.swift
//  Stredo Watch App
//
//  Created by Fernando Putra on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isOverlayVisible = false

    var body: some View {
        ZStack {
            content
            if isOverlayVisible {
                overlay
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3)) {
                isOverlayVisible.toggle()
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()

    }

    private var content: some View {
        Color.black
    }

    private var overlay: some View {
        Color.black.opacity(0.5)
            .blur(radius: 10)
            .overlay(
                VStack {
                    Text("Overlay")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)

                    Button(action: {
                        withAnimation(.spring()) {
                            isOverlayVisible.toggle()
                        }
                    }) {
                        Text("Dismiss")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            )
            .onTapGesture {
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
