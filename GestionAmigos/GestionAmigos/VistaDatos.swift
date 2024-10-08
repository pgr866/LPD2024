import SwiftUI

struct VistaDatos: View {
    var amigoCurrent: Amigo
    var body: some View {
        VStack {
            Text(amigoCurrent.nombre)
                .font(.title)
                .foregroundColor(.white)
            Label(amigoCurrent.telefono, systemImage:"iphone")
                .font(.body)
            Link(destination: URL(string: "mailto:" + amigoCurrent.email)!, label: {
                Image(systemName: "envelope")
                    .frame(width: 20, height: 20, alignment: .center)
                Text(amigoCurrent.email)
            })
            Divider()
            Text("About " + amigoCurrent.nombre)
                .font(.title2)
            Text(amigoCurrent.about)
                .font(.footnote)
            Spacer()
        }.background(Color.brown)
    }
}
