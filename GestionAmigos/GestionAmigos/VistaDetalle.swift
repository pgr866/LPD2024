import SwiftUI

struct VistaDetalle: View {
    @EnvironmentObject private var modeloDatos: ModeloDatos
    var amigoCurrent: Amigo
    var body: some View {
        ScrollView {
            VistaMapa(latitud: amigoCurrent.latitud, longitud: amigoCurrent.longitud)
                .frame(height: 250, alignment:.center)
            VistaImagen(imagenID: amigoCurrent.imagenID)
                .padding(.bottom, -100)
                .offset(y:5)
            VistaDatos(amigoCurrent: amigoCurrent)
                .offset(y:60)
        }
        .background(Color.brown)
        .navigationTitle(amigoCurrent.nombre)
        .navigationBarTitleDisplayMode(.inline)
    }
}
