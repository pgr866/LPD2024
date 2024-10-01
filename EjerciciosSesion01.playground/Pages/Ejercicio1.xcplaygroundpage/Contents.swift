import Foundation

// Ejercicio 1: Mostramos 4 números aleatorios (entre 0 y 9.9999) mostrando por consola la salida formateada con 4 decimales
for i in 0...3 {
    let number = Double.random(in: 0..<10)
    print("\(i) .- " + String(format: "%.4f", number))  // Formato con 4 decimales
}

// Generamos 4 números aleatorios, los redondeamos, y mostramos el resultado
for i in 0...3 {
    let number = Double.random(in: 0..<10)
    let roundedNumber = round(number * 100) / 100  // Redondeamos a 2 decimales
    print("\(i) .- " + String(format: "%.2f", roundedNumber))  // Formato con 2 decimales
}

// Recorremos un rango de números y determinamos si son pares
for i in -5..<10 {
    if i % 2 == 0 {
        print("\(i) es par")
    }
}

// Sintaxis más sencilla con la cláusula "where"
for i in -5..<10 where i % 2 == 0 {
    print("\(i) es par")
}
