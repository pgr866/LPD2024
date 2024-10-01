import UIKit

// Definición de la función getMessage
func getMessage(lugar: String, accion: (Int, String) -> String) -> String {
    // Llama a la clausura con un número aleatorio entre 1 y 3, y el lugar proporcionado
    return accion(Int.random(in: 1...3), lugar)
}

// Llamada a la función getMessage con la clausura definida
var mensaje: String = getMessage(lugar: "Londres") { (tipoViaje, lugar) -> String in
    switch tipoViaje {
    case 1:
        return "me voy de marcha a \(lugar)"
    case 2:
        return "me voy a trabajar a \(lugar)"
    case 3:
        return "me voy a estudiar a \(lugar)"
    default:
        return "me voy a \(lugar)"
    }
}

// Imprimir el mensaje
print(mensaje)

// Llamada a la función getMessage simplificada usando valores predeterminados
var mensajeSimplificado: String = getMessage(lugar: "Londres") { "me voy \((($0 == 1) ? "de marcha" : ($0 == 2) ? "a trabajar" : ($0 == 3) ? "a estudiar" : "")) a \($1)" }

// Imprimir el mensaje simplificado
print(mensajeSimplificado)
