import SwiftUI

struct AddMascotaView: View {
    @EnvironmentObject var vm: ViewModel
    @State var nombre: String = ""
    @State var edad: Double = 0
    @State var tipoMascota: String = "Perro"
    @Binding var mostrarAddMascota: Bool
    var persona: PersonaEntity  // Persona a la que se le añadirá la mascota
    
    var body: some View {
        VStack(spacing: 10) {
            // Campo para el nombre de la mascota
            TextField("Nombre de la mascota", text: $nombre)
                .font(.system(size: 20, weight: .bold))
                .textCase(.none)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
            
            // Control deslizante para la edad
            VStack {
                HStack {
                    Text("Edad: \(Int(edad))")  // Convertimos la edad a Int para mostrar
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .textCase(.none)
                    Slider(value: $edad, in: 0...20, step: 1)  // Ajuste de rango y paso
                }
                .padding(.horizontal)
            }
            
            // Picker para seleccionar el tipo de mascota
            Picker("Tipo de Mascota", selection: $tipoMascota) {
                Text("Perro").tag("Perro")
                Text("Gato").tag("Gato")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Botones de aceptar y cancelar
            HStack(spacing: 50) {
                // Botón cancelar
                Button(action: {
                    mostrarAddMascota = false
                }) {
                    Image(systemName: "hand.thumbsdown")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                }
                
                // Botón aceptar
                Button(action: {
                    // Añadir mascota al ViewModel
                    vm.addMascota(persona: persona, nombre: nombre, edad: Int16(edad), raza: tipoMascota)
                    mostrarAddMascota = false
                }) {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 20)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemGray6)).shadow(radius: 10))
        .padding()
    }
}
