import SwiftUI

@main
struct GestionAmigosApp: App {
    @StateObject private var modeloDatos = ModeloDatos()
    var body: some Scene {
        WindowGroup {
            ListaAmigos()
                .environmentObject(modeloDatos)
        }
    }
}
