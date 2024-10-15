import SwiftUI

struct VistaMain: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var seleccion: Int = 0
    var body: some View {
        TabView(selection: $seleccion) {
            VistaIdentificacion()
                .tabItem {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                    Text("Identificación")
                }
                .tag(0)
            
            VistaListaAmigos().environmentObject(amigoVM)
                .tabItem {
                    Image(systemName: "person.2.wave.2")
                    Text("Lista de Amigos")
                }
                .tag(1)
            
            VistaChat().environmentObject(amigoVM)
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("Chat")
                }
                .tag(2)
        }
    }
}
