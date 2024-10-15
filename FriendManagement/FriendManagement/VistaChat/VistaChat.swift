import SwiftUI

struct VistaHeader: View {
    var nombre: String
    var imagenID: String
    
    var body: some View {
        HStack {
            Image(imagenID)
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 3)
            Text(nombre)
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            Button(action: {
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
            Button(action: {
            }) {
                Image(systemName: "minus.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    dateFormatter.locale = Locale(identifier: "es")
    return dateFormatter.string(from: date)
}

struct VistaChat: View {
    @EnvironmentObject var amigoVM: AmigoViewModel
    var body: some View {
        List() {
            ForEach(amigoVM.arrAmigos) { amigo in
                Section(
                    header: VistaHeader(nombre: amigo.nombre, imagenID: amigo.imagenID),
                    footer: Text("\(amigo.mensajes.count) mensaje\(amigo.mensajes.count == 1 ? "" : "s")")
                ) {
                    ForEach(amigo.mensajes, id: \.self) { mensajeStr in
                        HStack {
                            Image(systemName: mensajeStr.contestacion ?
                                  "arrow.right.to.line.circle" :
                                    "arrow.left.to.line.circle")
                            .foregroundColor(mensajeStr.contestacion ? Color.red : Color.green)
                            
                            Text(mensajeStr.texto)
                            
                            Spacer()
                            
                            Text(formatDate(date: mensajeStr.date))
                                .font(.caption2)
                                .fontWeight(.thin)
                                .foregroundColor(Color.gray)
                                .padding([.top, .leading])
                        }
                    }
                }
            }
        }
    }
}
