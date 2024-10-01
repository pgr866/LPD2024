// Implementación de la función
func funcionEjercicio01(valor: Int, accion1: (Int) -> String, accion2: (Int) -> String) {
    for i in 1...valor {
        print("Iteración \(i)", "Acción 1", accion1(i), separator: " -> ")
        print("Iteración \(i)", "Acción 2", accion2(i), separator: " -> ")
    }
}

// Llamada a la función usando la sintaxis clásica
funcionEjercicio01(valor: 3, accion1: { numero in
    return "Valor \(numero * 2)"
}, accion2: { numero in
    return "Valor \(numero * 3)"
})

// Llamada a la función usando trailing closures
funcionEjercicio01(valor: 3) { numero in
    return "Valor \(numero * 2)"
} accion2: { numero in
    return "Valor \(numero * 3)"
}

// Uso de identificadores predeterminados ($0, $1)
funcionEjercicio01(valor: 3) {
    "Valor \($0 * 2)"
} accion2: {
    "Valor \($0 * 3)"
}
