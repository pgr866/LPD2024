import SwiftUI

@main
struct GestionMascotasApp: App {
    @StateObject private var vm: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ListaPersonasView()
                .environmentObject(vm)
        }
    }
}
