import SwiftUI

struct BusquedaView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .opacity(text.isEmpty ? 0.4 : 0.9) // Cambiar opacidad según el texto
            TextField("Buscar…", text: $text)
                //.padding(7)
                //.background(Color(.systemGray6))
                .cornerRadius(8)
            
            if !text.isEmpty {
                Button(action: {
                    text = "" // Limpiar el campo de búsqueda
                }) {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray).shadow(radius: 2))
    }
}

struct VistaListaAmigos: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    @State var query: String = ""
    @State var soloFavoritos = false
    var body: some View {
        NavigationView{
            VStack {
                BusquedaView(text: $query)
                List(){
                    Toggle(isOn: $soloFavoritos){
                        Text("Mostrar solo los favoritos")
                    }
                    ForEach(amigoVM.arrAmigos.filter { amigo in
                        (!soloFavoritos || amigo.favorito) &&
                        (query.isEmpty || amigo.nombre.lowercased().contains(query.lowercased()))
                    }) { amigo in
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
