import SwiftUI


@main
struct MyApp: App {
    init() {
        RotationSystem.registerSystem()
    }
    
    var body: some Scene {
        WindowGroup {
            SpaceView()
                .onAppear {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                }
        }
    }
}
