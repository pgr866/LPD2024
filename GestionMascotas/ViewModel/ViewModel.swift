import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject{
    let gestorCoreData = CoreDataManager.instance //singleton
    @Published var personasArray: [PersonaEntity] = []
    @Published var mascotasArray: [MascotaEntity] = []
    init(){
        cargarDatos()
    }
    func cargarDatos(){
        personasArray.removeAll()
        mascotasArray.removeAll()
        let fetchPersonas = NSFetchRequest<PersonaEntity>(entityName: "PersonaEntity")
        let fetchMascotas = NSFetchRequest<MascotaEntity>(entityName: "MascotaEntity")
        do{
            self.personasArray = try gestorCoreData.contexto.fetch(fetchPersonas).sorted(){$0.nombre! < $1.nombre!}
            self.mascotasArray = try gestorCoreData.contexto.fetch(fetchMascotas).sorted(){$0.nombre! < $1.nombre!}
        }catch let error{
            print("Error al cargar los datos: \(error)")
        }
    }
    
    func guardarDatos(){
        gestorCoreData.save()
        cargarDatos()
    }
    
    func addPersona(nombre: String, foto: UIImage){
        let nuevaPersona = PersonaEntity(context: gestorCoreData.contexto)
        nuevaPersona.nombre = nombre
        nuevaPersona.foto = foto.pngData()
        guardarDatos()
    }
    
    func deletePersona(indexSet: IndexSet){
        for index in indexSet{
            gestorCoreData.contexto.delete(personasArray[index])
        }
        guardarDatos()
    }
    
    func addMascota(persona: PersonaEntity, nombre: String, edad: Int16, raza: String){
        let nuevaMascota = MascotaEntity(context: gestorCoreData.contexto)
        nuevaMascota.nombre = nombre
        nuevaMascota.edad = edad
        nuevaMascota.raza = raza
        nuevaMascota.personasRelation = persona
        guardarDatos()
    }
    
    func deleteMascota(mascota: MascotaEntity){
        gestorCoreData.contexto.delete(mascota)
        guardarDatos()
    }
}
