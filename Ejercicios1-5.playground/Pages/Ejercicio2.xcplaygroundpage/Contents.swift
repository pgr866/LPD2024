import Foundation

// Ejercicio 2: Diccionario de alumnos con arrays de notas
var diccionario:[String:[Int]] = [:]

// Añadiendo algunas entradas iniciales
diccionario["andres"] = [2, 4]
diccionario["antonio"] = [3, 5, 6, 7]
diccionario["juan"] = [1, 4, 3]

// Añadiendo una nueva entrada o actualizando la existente
@MainActor
func agregarNotas(alumno: String, nuevasNotas: [Int]) {
    if var notasExistentes = diccionario[alumno] {
        // Si ya existen notas para el alumno, agregamos las nuevas
        notasExistentes.append(contentsOf: nuevasNotas)
        diccionario[alumno] = notasExistentes
    } else {
        // Si no existe el alumno, lo creamos con las nuevas notas
        diccionario[alumno] = nuevasNotas
    }
}

// Agregar notas a alumnos existentes o nuevos
agregarNotas(alumno: "andres", nuevasNotas: [5, 6])
agregarNotas(alumno: "emilia", nuevasNotas: [5, 7])
agregarNotas(alumno: "antonio", nuevasNotas: [8])

// Imprimir el diccionario
print(diccionario)

// Iterar sobre el diccionario ordenado por clave
for par in diccionario.sorted(by: { $0.key < $1.key }) {
    print("\(par.key) --> \(par.value)")
}

