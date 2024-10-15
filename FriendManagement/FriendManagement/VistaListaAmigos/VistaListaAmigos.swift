import SwiftUI

struct BusquedaView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(text.isEmpty ? Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
            TextField("Buscar...", text: $text)
                .foregroundColor(.primary)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "x.circle")
                        .foregroundColor(Color(UIColor.gray).opacity(0.9))
                }
            }
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
        .animation(.default, value: text)
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
                let result = amigoVM.arrAmigos.filter { amigo in
                    (!soloFavoritos || amigo.favorito) &&
                    (query.isEmpty || amigo.nombre.lowercased().contains(query.lowercased()))
                }
                List(){
                    Toggle(isOn: $soloFavoritos){
                        Text("Mostrar solo los favoritos")
                    }
                    if result.isEmpty {
                        Text("No hay resultados")
                    }
                    ForEach(result) { amigo in
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
