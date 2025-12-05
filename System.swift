//
//  System.swift
//  Astronomous
//
//  Created by Victor Kaue Lima De Paiva on 27/11/25.
//

//
//  RotationSystem.swift
//  Astronomous
//
//  Created by Victor Kaue Lima De Paiva on 27/11/25.
//

import RealityKit

struct RotationComponent: Component {
    let rotationVelocity: Float = 1.0
}

class RotationSystem: System {

    private static let query = EntityQuery(where: .has(RotationComponent.self))
    
    required init(scene: Scene) { }
    
    func update(context: SceneUpdateContext){
        let delta = context.deltaTime // pega delta de tempo da cena
        for entity in context.entities(matching: Self.query, updatingSystemWhen: .rendering){
            guard let rotation = entity.components[RotationComponent.self] else {continue}
            
            let angle = rotation.rotationVelocity * Float(delta)
            let axis = simd_quatf(angle: angle, axis: [0,1,0])
            
            entity.transform.rotation *= axis
        }
    }
    
}
