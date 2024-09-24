import SwiftUI

struct VistaPrincipal: View {
    @State private var nombreUsuario: String = ""
    @State private var apellidosUsuario: String = ""
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                Image("logoUAL")
                    .imageScale(.large)
                SaludoText(nombreUsuario, apellidosUsuario)
                // Campo de texto para el nombre
                HStack {
                    Text("Nombre  ") // Etiqueta para el campo de nombre
                        .font(.headline)
                        .foregroundColor(.black)
                    TextField("Introduzca su nombre", text: $nombreUsuario)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                // Campo de texto para los apellidos
                HStack {
                    Text("Apellidos") // Etiqueta para el campo de apellidos
                        .font(.headline)
                        .foregroundColor(.black)
                    TextField("Introduzca sus apellidos", text: $apellidosUsuario)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                // Botón Reset
                Button(action: {
                    nombreUsuario = ""
                    apellidosUsuario = ""
                }) {
                    Text("Reset")
                }
                .disabled(nombreUsuario.isEmpty && apellidosUsuario.isEmpty) // Deshabilitar si ambos campos están vacíos
            }
            .padding()
        }
    }
}

struct VistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VistaPrincipal().preferredColorScheme(.light)
            VistaPrincipal().preferredColorScheme(.dark)
        }
    }
}
