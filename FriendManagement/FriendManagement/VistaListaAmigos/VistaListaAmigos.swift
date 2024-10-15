import SwiftUI

struct VistaListaAmigos: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var soloFavoritos = false
    var body: some View {
        NavigationView{
            List(){
                Toggle(isOn: $soloFavoritos){
                    Text("Mostrar solo los favoritos")
                }
                ForEach(amigoVM.arrAmigos){amigo in
                    if !soloFavoritos || amigo.favorito {
                        NavigationLink(destination: VistaDetalle(amigoCurrent: amigo)){
                            HStack{
                                Image(amigo.imagenID)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .shadow(color: Color.red, radius: 1)
                                VStack(alignment: .leading){
                                    Text(amigo.nombre)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.green)
                                    Text(amigo.telefono)
                                        .font(.caption2)
                                        .fontWeight(.medium)
                                }
                                Spacer()
                                Image(systemName: amigo.favorito ? "star.fill" : "star")
                                    .foregroundColor(amigo.favorito ? .yellow : .gray)
                            }
                            .background(Color.white)
                        }
                    }
                }
            }.navigationTitle("Amigos")
        }
    }
}

struct ListaVistaAmigos_Previews: PreviewProvider {
    static var previews: some View {
        VistaListaAmigos()
            .environmentObject(AmigoViewModel())
    }
}
