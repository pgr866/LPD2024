import SwiftUI

@main
struct FriendsManagementApp: App {
    @StateObject private var amigoVM = AmigoViewModel()
    var body: some Scene {
        WindowGroup {
            VistaMain()
                .environmentObject(amigoVM)
        }
    }
}
