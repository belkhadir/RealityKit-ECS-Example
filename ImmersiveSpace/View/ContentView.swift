//
//  ContentView.swift
//  ImmersiveSpace
//
//  Created by belkhadir on 21/9/2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(AppModel.self) var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @State var isLoading = false
    
    var body: some View {
        Button("Open Immersive Space") {
            Task {
                isLoading = true
                await model.addBrick()
                isLoading = false
                await openImmersiveSpace(id: "ImmersiveScene")
            }
        }
        if isLoading {
            ProgressView()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
