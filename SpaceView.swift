import SwiftUI
import RealityKit

struct ContentView: View {
    @StateObject var viewModel = await ContentViewModel()
    
    var body: some View {
        RealityView { content in
            
        }
    }
}

//struct ContentView: View {
//    let scale: SIMD3<Float> = [4,4,4]
//    let position: SIMD3<Float> = [0,0,-1]
//    
//    var body: some View {
//        RealityView { content in
//            let anchor = AnchorEntity(world: .zero)
//            if let sun = await requestSunFile(){
//                anchor.addChild(sun)
//            }
//            content.add(anchor)
//        }
//        
//    }
//    
//    func requestSunFile() async -> Entity? {
//        do {
//            let sun = try await Entity.init(named: "Sun", in: nil)
//            sun.components[RotationComponent.self] = RotationComponent()
//            sun.position = position
//            sun.scale = scale
//            
//            return sun
//        } catch{
//            print("Erro: \(error)")
//        }
//        return nil
//    }
//    
//}

#Preview {
    ContentView()
}

//
//// 1. Gera uma esfera enorme (raio de 1000 metros, por exemplo)
//let skyboxMesh = MeshResource.generateSphere(radius: 1000)
//
//// 2. Usa um UnlitMaterial para que as estrelas brilhem sem precisar de luz na cena
//var material = UnlitMaterial()
//if let starsTexture = try? TextureResource.load(named: "starfield_texture") {
//    material.color = .init(tint: .white, texture: .init(starsTexture))
//}
//
//// 3. Cria a entidade e inverte a escala para ver o interior da esfera
//let skyboxEntity = ModelEntity(mesh: skyboxMesh, materials: [material])
//skyboxEntity.scale *= .init(x: -1, y: 1, z: 1) // Inversão crucial
//
//content.add(skyboxEntity)
