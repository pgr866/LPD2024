import SwiftUI

struct VistaDatos: View {
    @EnvironmentObject private var amigoVM: AmigoViewModel
    @State private var textoOpinion: String = ""
    @State private var favorito = false
    @State private var amigoIndex: Int = -1
    var amigoCurrent: Amigo
    var body: some View {
        VStack {
            HStack{
                Text(amigoCurrent.nombre)
                    .font(.title)
                    .foregroundColor(.white)
                Button{
                    favorito.toggle()
                }label:{
                    Image(systemName: favorito ? "star.fill" : "star")
                        .foregroundColor(favorito ? .yellow : .gray)
                }
            }
            Label(amigoCurrent.telefono, systemImage:"iphone")
                .font(.body)
            Link(destination: URL(string: "mailto:" + amigoCurrent.email)!, label: {
                Image(systemName: "livephoto")
                    .frame(width: 20, height: 20, alignment: .center)
                Text(amigoCurrent.email)
            })
            Divider()
            HStack {
                Text("About " + amigoCurrent.nombre)
                    .font(.headline)
                Image(systemName: "pencil")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            TextEditor(text: $textoOpinion)
                .frame(width: 350, height: 200)
                .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                .onChange(of: textoOpinion){
                    if (textoOpinion.count > 150) {
                        textoOpinion = String(textoOpinion.prefix(150))
                    }
                }
                .font(.footnote)
                .scrollContentBackground(.hidden)
            let characterCount: Int = Int(textoOpinion.count)
            ProgressView("Número de caracteres: \(characterCount)/150", value: min(Double(characterCount), 150), total: 150)
                .progressViewStyle(LinearProgressViewStyle())
                .accentColor(characterCount >= 100 ? .red : .blue)
                .frame(width: 300)
            Spacer()
        }.background(Color.brown)
        .onAppear {
            textoOpinion = amigoCurrent.about
            favorito = amigoCurrent.favorito
            amigoIndex = amigoVM.arrAmigos.firstIndex(where: {$0.id == amigoCurrent.id})!
        }
        .onDisappear {
            amigoVM.arrAmigos[amigoIndex].about = textoOpinion
            amigoVM.arrAmigos[amigoIndex].favorito = favorito
        }
    }
}
