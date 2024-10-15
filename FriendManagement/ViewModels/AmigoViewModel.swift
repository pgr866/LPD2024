import Foundation

final class AmigoViewModel: ObservableObject {
    @Published var arrAmigos: [Amigo] = [
        Amigo(nombre: "Donald Trump", telefono: "1234567890", email: "donaldtrump@gmailing.com",
              about: "Donald is an ordinary businessman", imagenID: "donald",
              latitud: 38.897003, longitud: -77.036549, favorito: true,
              mensajes: [
                Mensaje(date: Date(), texto: "Hola, ¿cómo vas?", contestacion: false),
                Mensaje(date: Date(), texto: "Adiós", contestacion: true)
              ]),
        Amigo(nombre: "Mark Zuckerberg", telefono: "0123456789", email: "markzuckerberg@gmailing.com",
              about: "He is crazy about AI", imagenID: "mark",
              latitud: 37.433722, longitud: -122.133986, favorito: false,
              mensajes: [
                Mensaje(date: Date(), texto: "Hola y adiós", contestacion: true)
              ]),
        Amigo(nombre: "Elon Musk", telefono: "9012345678", email: "elonmusk@gmailing.com",
              about: "He is crazy about rockets", imagenID: "elon", latitud: 33.765065,
              longitud: -118.180057, favorito: true,
              mensajes: [
                Mensaje(date: Date(), texto: "Hola", contestacion: false),
                Mensaje(date: Date(), texto: "Adiós", contestacion: true)
              ])
    ]
}
