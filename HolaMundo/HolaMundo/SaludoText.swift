import SwiftUI

struct SaludoText: View {
    private var msg: String

    // Inicializador
    init(_ nombreUsuario: String, _ apellidosUsuario: String) {
        if nombreUsuario.isEmpty && apellidosUsuario.isEmpty {
            msg = "Hola, ¿qué tal?"
        } else {
            msg = "Hola, \(nombreUsuario + " " + apellidosUsuario)"
        }
    }

    var body: some View {
        Text(msg)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color.blue)
            .padding()
    }
}
