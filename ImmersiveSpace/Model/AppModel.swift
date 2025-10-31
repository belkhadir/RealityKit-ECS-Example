//
//  AppModel.swift
//  ImmersiveSpace
//
//  Created by belkhadir on 23/9/2025.
//

import RealityKit
import Foundation
import UIKit

@Observable
final class AppModel {
    private let modelCount = 200
    let rootEntity = Entity()
    
    init() {
        FloatingSystem.registerSystem()
    }
    
    func addBrick() async {
        for _ in 0..<modelCount {
            let brick = try! await createBrick()
            rootEntity.addChild(brick)
        }
    }
}

// MARK: - Helpers
private extension AppModel {
    func createBrick() async throws -> ModelEntity {
        let brick = try await ModelEntity(named: "brick")
        brick.model?.materials = [random()]
        brick.setScale(SIMD3(repeating: 0.4 * .random(in: 0.5...2)), relativeTo: brick)
        brick.components.set(FloatingComponent(axis: [
            .random(in: -2...2),
            .random(in: 0...1.5),
            .random(in: -2...0.5)
        ]))
        
        return brick
    }
    
    func random() -> SimpleMaterial {
        colors
            .map { SimpleMaterial(color: $0, isMetallic: false) }
            .randomElement()!
    }
}

private let colors: [UIColor] = [
    .black,
    .darkGray,
    .lightGray,
    .white,
    .gray,
    .red,
    .green,
    .blue,
    .cyan,
    .yellow,
    .magenta,
    .orange,
    .purple,
    .brown,
]
