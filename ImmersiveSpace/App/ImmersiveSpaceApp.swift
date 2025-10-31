//
//  ImmersiveSpaceApp.swift
//  ImmersiveSpace
//
//  Created by belkhadir on 21/9/2025.
//

import SwiftUI


@main
struct ImmersiveSpaceApp: App {
    @State private var model = AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
        
        ImmersiveSpace(id: "ImmersiveScene") {
            ImmersiveSpaceView()
                .environment(model)
        }
    }
}
