import Foundation

// Ejercicio 3: Diccionario de alumnos con arrays de notas
var diccionario:[String:[Int]] = [:]

// Añadiendo algunas entradas iniciales
diccionario["andres"] = [2, 4]
diccionario["antonio"] = [3, 5, 6, 7]
diccionario["juan"] = [1, 4, 3]

// Ordenar por número de notas (longitud del array) en orden ascendente
let ordenAscendente = diccionario.sorted { $0.value.count < $1.value.count }
print("Diccionario ordenado por número de notas (ascendente):")
for par in ordenAscendente {
    print("\(par.key) --> \(par.value) (Notas: \(par.value.count))")
}

// Ordenar por número de notas (longitud del array) en orden descendente
let ordenDescendente = diccionario.sorted { $0.value.count > $1.value.count }
print("\nDiccionario ordenado por número de notas (descendente):")
for par in ordenDescendente {
    print("\(par.key) --> \(par.value) (Notas: \(par.value.count))")
}
