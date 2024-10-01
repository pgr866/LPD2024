import SwiftUI

struct ListaAmigos: View {
    @State var soloFavoritos = false
    var body: some View {
        List(){
            Toggle(isOn: $soloFavoritos){
                Text("Mostrar solo los favoritos")
            }
            ForEach(ModeloDatos().arrAmigos){
                if !soloFavoritos || $0.favorito {
                    VistaFila(amigoCurrent: $0)
                }
            }
        }
    }
}

#Preview {
    ListaAmigos()
}
