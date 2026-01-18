//
//  EntitiesFactory.swift
//  Astronomous
//
//  Created by Victor Kaue Lima De Paiva on 02/01/26.
//

import RealityKit

enum EntityType: CaseIterable {
    case nebulous, sun, redGiant, supernova
}

struct EntitiesFactory {
    
    
    static func createEntity(_ type: EntityType) async throws -> Entity {
        switch type {
        case .sun:
            return try await createSun()
        default:
            fatalError("\(type) not implemented yet")
        }
    }
    
    @MainActor
    private static func createSun() async throws -> Entity {
        let sun = try await Entity(named: "Sun")
        sun.components[RotationComponent.self] = RotationComponent()
        sun.position = [0, 0, -1]
        sun.scale = [4, 4, 4]
        return sun
    }
}
