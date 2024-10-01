import Foundation
import SwiftUI

struct Amigo: Identifiable {
    var id = UUID().uuidString
    var nombre: String
    var telefono: String = ""
    var email: String = ""
    var about: String = ""
    var imagenID: String
    var imagen: Image {
        Image(imagenID)
    }
    var latitud: Double = 0.0
    var longitud: Double = 0.0
    var favorito: Bool = false //este atributo es nuevo...
}
