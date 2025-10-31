//
//  ImmersiveSpaceView.swift
//  ImmersiveSpace
//
//  Created by belkhadir on 21/9/2025.
//

import SwiftUI
import RealityKit

struct ImmersiveSpaceView: View {
    @Environment(AppModel.self) var model
    
    var body: some View {
        RealityView { content in
            content.add(model.rootEntity)
        }
    }
}

#Preview {
    ImmersiveSpaceView()
}
