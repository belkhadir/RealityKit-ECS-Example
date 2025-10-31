//
//  FloatingComponent.swift
//  ImmersiveSpace
//
//  Created by belkhadir on 31/10/2025.
//

import RealityKit

struct FloatingComponent: Component {
    var speed: Float
    var axis: SIMD3<Float>
    
    init(speed: Float = 0.001, axis: SIMD3<Float>) {
        self.speed = speed
        self.axis = axis
    }
}
