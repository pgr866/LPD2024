import SwiftUI

struct VistaIdentificacion: View {
    @AppStorage("userName") var userName: String?
    @State var currentUserName = ""
    @State var cambiarNombre: Bool = false
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 2))
                .shadow(color: Color.gray, radius: 39)
            
            HStack {
                Text("Hola \(currentUserName)")
                    .font(.title)
                    .foregroundColor(.black)
                
                Button {
                    withAnimation {
                        cambiarNombre.toggle()
                    }
                } label: {
                    Image(systemName: "keyboard")
                        .foregroundColor(.red)
                }
            }
            
            if cambiarNombre {
                TextField("¿Cuál es tu nombre?", text: $currentUserName)
            }
        }
        .onAppear {
            currentUserName = userName ?? "desconocido/a/e"
        }
        .onDisappear {
            // Al cerrar la vista, se guarda el valor del nombre del usuario
            if currentUserName.isEmpty {
                userName = nil // Si el nombre está vacío, se guarda como nil
            } else {
                userName = currentUserName // Si no está vacío, se guarda el nombre
            }
        }
    }
}
