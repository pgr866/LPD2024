import SwiftUI

struct ListaPersonasView: View {
    @EnvironmentObject var vm: ViewModel
    @State var mostrarAddPersona: Bool = false;
    var body: some View {
        NavigationView{
            VStack{
                if mostrarAddPersona {
                    AddPersonaView(mostrarAddPersona: $mostrarAddPersona)
                }
                List(){
                    ForEach(vm.personasArray) {persona in
                        Section(header: HeaderView(persona: persona).environmentObject(vm)){
                            FilaView(persona: persona).environmentObject(vm)
                        }
                    }
                    .onDelete(perform: vm.deletePersona)
                }
                .navigationTitle("Personas")
                .navigationBarItems(
                    trailing:
                        Button(){
                            mostrarAddPersona.toggle()
                        }label:{
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .shadow(color: .pink, radius: 14, x: 5, y: 5)
                                .shadow(color: .gray, radius: 14, x: -5, y: -5)
                        }
                )
            }
        }
    }
}

struct HeaderView: View{
    @EnvironmentObject var vm: ViewModel
    var persona: PersonaEntity
    @State var mostrarAddMascota = false
    var body: some View{
        if persona.foto != nil {
            HStack(){
                Button(action: {
                    mostrarAddMascota = true
                }) {
                    Image(uiImage: UIImage(data: persona.foto!)!)
                        .resizable()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .frame(width: 50, height: 50)
                        .padding(.leading, -20)
                }
                .sheet(isPresented: $mostrarAddMascota) {
                    AddMascotaView(mostrarAddMascota: $mostrarAddMascota, persona: persona)
                        .environmentObject(vm)
                }
                Text(persona.nombre!)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular))
                    .textCase(.none)
            }
        }
    }
}

struct FilaView: View{
    @EnvironmentObject var vm: ViewModel
    var persona: PersonaEntity
    var body: some View{
        if let mascotas = persona.mascotasRelation?.allObjects as? [MascotaEntity] {
            VStack{
                Text("\(mascotas.count) mascotas")
                ForEach(mascotas) {mascota in
                    HStack{
                        Image(mascota.raza!)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFill()
                        Text("\(mascota.nombre!) (\(mascota.edad) años)")
                        Spacer()
                        Image(systemName: "minus.circle")
                            .font(.headline)
                            .foregroundColor(.red)
                            .onTapGesture {
                                vm.deleteMascota(mascota: mascota)
                            }
                    }
                }
            }
        }
    }
}

struct AddPersonaView: View{
    @EnvironmentObject var vm: ViewModel
    @State var nombre: String = ""
    @State var mostrarImagePicker: Bool = false
    @State var imageGeneral: UIImage = UIImage(systemName: "person.circle")!
    @Binding var mostrarAddPersona: Bool
    var body: some View{
        HStack {
            Button(){
                mostrarImagePicker.toggle()
            }label:{
                Image(uiImage: imageGeneral)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height:90)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                    .shadow(color: .gray, radius:9)
                    .padding(.vertical)
                    .padding(.horizontal)
            }
            .sheet(isPresented: $mostrarImagePicker){
                ImagePicker(sourceType: .photoLibrary){imageSeleccionada in
                    imageGeneral = imageSeleccionada
                }
            }
            VStack {
                TextField("Nombre de la persona...", text: $nombre)
                HStack {
                    Spacer()
                    Button(){
                        vm.addPersona(nombre: nombre.isEmpty ? "NoName" : nombre, foto: imageGeneral)
                    }label:{
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                            .resizable()
                            .frame(width: 40, height:40)
                            .shadow(color: .pink, radius: 14, x: 5, y: 5)
                            .shadow(color: .gray, radius: 14, x: -5, y: -5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ListaPersonasView_Previews: PreviewProvider {
    static var previews: some View {
        ListaPersonasView()
            .environmentObject(ViewModel())
    }
}
