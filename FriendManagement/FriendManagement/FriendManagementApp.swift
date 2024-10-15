import SwiftUI

@main
struct FriendManagementApp: App {
    @StateObject private var amigoVM = AmigoViewModel()
    var body: some Scene {
        WindowGroup {
            VistaListaAmigos()
                .environmentObject(amigoVM)
        }
    }
}
