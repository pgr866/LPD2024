import SwiftUI

struct ListaAmigos: View {
    @EnvironmentObject var modeloDatos: ModeloDatos
    @State var soloFavoritos = false
    var body: some View {
        NavigationView{
            List(){
                Toggle(isOn: $soloFavoritos){
                    Text("Mostrar solo los favoritos")
                }
                ForEach(modeloDatos.arrAmigos){amigo in
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

struct ListaVistaAmigos_Previews: PreviewProvider {
    static var previews: some View {
        ListaAmigos()
            .environmentObject(ModeloDatos())
    }
}
