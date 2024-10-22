import SwiftUI

struct VistaDetalle: View {
    @EnvironmentObject private var modeloDatos: AmigoViewModel
    var amigoCurrent: Amigo
    var body: some View {
        ScrollView {
            VistaMapa(latitud: amigoCurrent.latitud, longitud: amigoCurrent.longitud)
                .frame(height: 230, alignment:.center)
            VistaImagen(imagenID: amigoCurrent.imagenID)
                .padding(.bottom, -50)
                .offset(y:5)
            VistaDatos(amigoCurrent: amigoCurrent)
                .offset(y:45)
        }
        .background(Color.brown)
        .navigationTitle(amigoCurrent.nombre)
        .navigationBarTitleDisplayMode(.inline)
    }
}
