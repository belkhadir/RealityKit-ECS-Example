//
//  ContentView.swift
//  ImmersiveSpace
//
//  Created by belkhadir on 21/9/2025.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @Environment(AppModel.self) var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        let buttonText = model.isImmersiveOpen ? "Dismiss Immersive Space": "Open Immersive Space"
        Button(buttonText) {
            Task {
                await model.addBrick()
                if model.isImmersiveOpen {
                    await dismissImmersiveSpace()
                    model.isImmersiveOpen = false
                } else {
                    await openImmersiveSpace(id: "ImmersiveScene")
                    model.isImmersiveOpen = true
                }
            }
        }.disabled(model.isLoadingAssets)
        if model.isLoadingAssets {
            ProgressView()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
