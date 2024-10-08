import SwiftUI

struct ListaAmigos: View {
    @State var soloFavoritos = false
    var body: some View {
        NavigationView{
            List(){
                Toggle(isOn: $soloFavoritos){
                    Text("Mostrar solo los favoritos")
                }
                ForEach(ModeloDatos().arrAmigos){amigo in
                    if !soloFavoritos || amigo.favorito {
                        NavigationLink(destination: VistaDetalle(amigoCurrent: amigo)){
                            VistaFila(amigoCurrent: amigo)
                        }
                    }
                }
            }.navigationTitle("Amigos")
        }
    }
}

#Preview {
    ListaAmigos()
}
