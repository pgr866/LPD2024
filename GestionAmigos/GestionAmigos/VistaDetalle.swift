import SwiftUI

struct VistaDetalle: View {
    var body: some View {
        VStack {
            VistaMapa()
            VistaImagen()
            VistaDatos()
        }.background(Color.brown)
    }
}

struct VistaDetalle_Previews: PreviewProvider {
    static var previews: some View {
        VistaDetalle()
    }
}
