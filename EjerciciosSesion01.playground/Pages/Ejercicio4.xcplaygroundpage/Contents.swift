import Foundation

// Ejercicio 4: Diccionario de alumnos con arrays de notas
var diccionario:[String:[Int]] = [:]

// Añadiendo algunas entradas iniciales
diccionario["andres"] = [2, 4]
diccionario["antonio"] = [3, 5, 6, 7]
diccionario["juan"] = [1, 4, 3]

// Función para calcular la nota media
func notaMedia(notas: [Int]) -> String {
    let suma = notas.reduce(0, +)
    let media = Double(suma) / Double(notas.count)
    return String(format: "%.2f", media)
}

// Función para calcular estadísticas de notas
func estadisticasNotas(notas: [Int]) -> (maxima: Int, minima: Int, suma: Int, media: Double) {
    let maxima = notas.max() ?? 0
    let minima = notas.min() ?? 0
    let suma = notas.reduce(0, +)
    let media = Double(suma) / Double(notas.count)
    return (maxima, minima, suma, media)
}

// Ordenar el diccionario por nota media en orden descendente
let ordenPorNotaMedia = diccionario.sorted {
    let media1 = Double($0.value.reduce(0, +)) / Double($0.value.count)
    let media2 = Double($1.value.reduce(0, +)) / Double($1.value.count)
    return media1 > media2
}

// Mostrar el diccionario ordenado por nota media
print("Diccionario ordenado por nota media (descendente):")
for par in ordenPorNotaMedia {
    let media = notaMedia(notas: par.value)
    print("\(par.key) --> \(media)")
}

// Ejemplo extra: Calcular estadísticas para un array de notas
let notasEjemplo = [3, 5, 7, 2, 6]
let estadisticas = estadisticasNotas(notas: notasEjemplo)
print("\nEstadísticas de notas:")
print("Nota máxima: \(estadisticas.maxima)")
print("Nota mínima: \(estadisticas.minima)")
print("Suma de notas: \(estadisticas.suma)")
print("Nota media: \(String(format: "%.2f", estadisticas.media))")
