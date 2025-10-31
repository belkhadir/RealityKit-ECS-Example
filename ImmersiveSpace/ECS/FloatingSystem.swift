//
//  FloatingSystem.swift
//  ImmersiveSpace
//
//  Created by belkhadir on 31/10/2025.
//

import RealityKit

final class FloatingSystem: System {
    private let query = EntityQuery(where: .has(FloatingComponent.self))
    
    init(scene: Scene) {}
    
    func update(context: SceneUpdateContext) {
        for entity in context.entities(matching: query, updatingSystemWhen: .rendering) {
            var component = entity.components[FloatingComponent.self]!
            
            if component.axis.z > 2 {
                component.axis.z = .random(in: -2...0)
            } else {
                component.axis.z += component.speed
            }
            
            entity.components[FloatingComponent.self] = component
            
            entity.setPosition(component.axis, relativeTo: nil)
            entity.setOrientation(simd_quatf(angle: component.speed, axis: component.axis), relativeTo: entity)
        }
    }
}
