import SwiftUI
import RealityKit

struct ContentView: View {
    let scale: SIMD3<Float> = [4,4,4]
    var body: some View {
        RealityView { content in
            if let background = backgroundEnvironment() {
                content.environment = .skybox(background)
            }
            RotationSystem.registerSystem()
            let anchor = AnchorEntity(world: .zero)
            let sun = requestSunFile()
            sun.components[RotationComponent.self] = RotationComponent()
            sun.position = [0,0,-1]
            
            sun.scale = scale
            
            anchor.addChild(sun)
            
            content.add(anchor)
        }
        
    }
    
    func requestSunFile() -> Entity {
        do {
            let sun = try Entity.load(named: "SunToXcode")
            return sun
        } catch {
            print("Erro ao carregar a entidade SunToXcode: \(error)")
            return Entity()
        }
    }
    
    func backgroundEnvironment() -> EnvironmentResource? {
        do {
            let environment = try EnvironmentResource.load(named: "spaceOutput")
            print("carregado com sucesso!")
            return environment
        } catch {
            print("Erro ao carregar o EnvironmentResource SpaceBackground: \(error)")
            return nil
        }
    }
}

#Preview {
        ContentView()
}
