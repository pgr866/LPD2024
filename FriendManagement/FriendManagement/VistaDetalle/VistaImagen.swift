import SwiftUI

struct VistaImagen: View {
    var imagenID: String
    // Variables de estado para modificar la imagen
    @State private var shadowColor: Color = Color.red             // Color de la sombra original
    @State private var strokeWidth: CGFloat = 2.0                 // Grosor del borde original
    @State private var borderColor: Color = Color.white           // Color del borde original

    var body: some View {
        Image(imagenID)
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(borderColor, lineWidth: strokeWidth))  // Borde dinámico
            .shadow(color: shadowColor, radius: 9)                       // Sombra dinámica
            .offset(y: -90)
            .padding(.bottom, -80)
            .onTapGesture {
                // Cambiar el color de la sombra de manera aleatoria
                shadowColor = Color(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1)
                )

                // Cambiar el grosor del borde aleatoriamente
                strokeWidth = CGFloat.random(in: 1...5) // Cambia el rango según tus necesidades

                // Cambiar el color del borde aleatoriamente
                borderColor = Color(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1)
                )
            }
    }
}
