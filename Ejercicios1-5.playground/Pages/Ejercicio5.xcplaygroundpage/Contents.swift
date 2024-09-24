import Foundation

// Ejercicio 5: Diccionario de alumnos con arrays de notas
var diccionario: [String: [Int]] = [:]

// Añadiendo algunas entradas iniciales
diccionario["andres"] = [2, 4]
diccionario["antonio"] = [3, 5, 6, 7]
diccionario["juan"] = [1, 4, 3]

// Función para calcular las estadísticas de notas
func estadisticas(notas: [Int]) -> (max: Int, min: Int, suma: Int, med: String) {
    let maxima = notas.max() ?? 0
    let minima = notas.min() ?? 0
    let suma = notas.reduce(0, +)
    let media = Double(suma) / Double(notas.count)
    let mediaFormateada = String(format: "%.2f", media)
    return (max: maxima, min: minima, suma: suma, med: mediaFormateada)
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
    let stats = estadisticas(notas: par.value)
    print("\(par.key) --> (max: \(stats.max), min: \(stats.min), suma: \(stats.suma), med: \"\(stats.med)\")")
}
