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
    @State var enEdicion: Bool = false
    @State var nombre: String = ""
    @State var telefono: String = ""
    @State var email: String = ""
    @State var imagenID: String = "Person"
    @State var mostrarAddAmigo: Bool = false
    @State var cancelAddAmigo: Bool = false
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
                    }.onDelete { indexSet in amigoVM.arrAmigos.remove(atOffsets: indexSet) }
                        .onMove { indices, newOffset in
                            amigoVM.arrAmigos.move(fromOffsets: indices, toOffset: newOffset)
                        }
                }.navigationTitle("Amigos")
                    .navigationBarItems(
                        leading:
                            Button(){
                                enEdicion.toggle()
                            }
                        label:{
                            Text(enEdicion ? "Cancelar" : "Editar")
                                .font(.title)
                                .foregroundColor(Color.blue)
                                .shadow(color: Color(red: 0.28, green: 0.855, blue: 0.92), radius:9)
                        },
                        trailing:
                            Button() {
                                mostrarAddAmigo.toggle()
                                nombre = ""
                                telefono = ""
                                email = ""
                                imagenID = "person"
                            } label: {
                                Image(systemName: "plus.circle")
                                    .font(.title)
                                    .foregroundColor(Color.red)
                                    .shadow(color: Color.pink, radius: 9)
                            }
                            .sheet(isPresented: $mostrarAddAmigo,
                                   onDismiss: {
                                       if !cancelAddAmigo {
                                           amigoVM.arrAmigos.append(Amigo(nombre: nombre.isEmpty ? "nuevoAmigo" : nombre,
                                                                          telefono: telefono.isEmpty ? "7777777777" : telefono,
                                                                          email: email.isEmpty ? "nuevoAmigo@gmailing.com" : email,
                                                                          imagenID: imagenID))
                                       }
                                   }, content: {
                                       VistaAddAmigo(nombre: $nombre, telefono: $telefono, email: $email, imagenID: $imagenID, cancelar: $cancelAddAmigo)
                                   }))
                    .environment(\.editMode, .constant(enEdicion ? EditMode.active : EditMode.inactive))
            }
        }
    }
}
