import SwiftUI

struct VistaAddAmigo: View {
    @Binding var nombre: String
    @Binding var telefono: String
    @Binding var email: String
    @Binding var imagenID: String
    @Binding var cancelar: Bool
    @Environment(\.presentationMode) var modoPresentacion
    var body: some View {
        VStack {
            Form() {
                Section(header: Text("Fotografía")) {
                    HStack {
                        Spacer()
                        Image(imagenID)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(color: .gray, radius: 9)
                        Spacer()
                    }
                }
                
                Section(header: Text("Datos")) {
                    TextField("Nombre del amigo", text: $nombre)
                    TextField("Teléfono del amigo", text: $telefono)
                    TextField("Email del amigo", text: $email)
                }
            }
            
            HStack {
                Button() {
                    cancelar = true
                    modoPresentacion.wrappedValue.dismiss()
                } label: {
                    Text("Cancelar")
                        .fontWeight(.bold)
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(88)
                }
                
                Button() {
                    cancelar = false
                    modoPresentacion.wrappedValue.dismiss()
                } label: {
                    Text("Guardar")
                        .fontWeight(.bold)
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(88)
                }
            }
        }
    }
}
