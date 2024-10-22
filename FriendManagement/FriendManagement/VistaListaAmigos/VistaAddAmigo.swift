import SwiftUI

struct VistaAddAmigo: View {
    @Binding var nombre: String
    @Binding var telefono: String
    @Binding var email: String
    @Binding var imagenID: String
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    VistaAddAmigo(nombre: .constant(""), telefono: .constant(""),
    email: .constant(""), imagenID: .constant("person"))
}
