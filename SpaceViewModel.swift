//
//  ContentViewModel.swift
//  Astronomous
//
//  Created by Victor Kaue Lima De Paiva on 02/01/26.
//


import RealityKit
import SwiftUI

@MainActor
class SpaceViewModel: ObservableObject {
    
    @Published var loadedEntities: [EntityType: Entity] = [:]
    @Published var loadingTypes: Set<EntityType> = []
    
    func loadEntity(_ type: EntityType) async {
        // Evita carregar o mesmo objeto duas vezes
        guard loadedEntities[type] == nil && !loadingTypes.contains(type) else { return }
        
        loadingTypes.insert(type)
        
        do{
            let entity = try await EntitiesFactory.createEntity(type)
            self.loadedEntities[type] = entity
        } catch {
            print("Erro ao carregar \(type): \(error)")
        }
        
        loadingTypes.remove(type)
    }
}

