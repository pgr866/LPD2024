import SwiftUI

struct VistaDatos: View {
    var body: some View {
        VStack {
            Text("Donald Trump")
                .font(.title)
                .foregroundColor(.white)
            Label("655-555-555", systemImage:"iphone")
                .font(.body)
            Link(destination: URL(string: "mailto:comments@whitehouse.gov")!, label: {
                Image(systemName: "envelope")
                    .frame(width: 20, height: 20, alignment: .center)
                Text("comments@whitehouse.gov")
            })
            Divider()
            Text("About Donald Trump")
                .font(.title2)
            Text("Es un amigo muy gracioso.")
                .font(.footnote)
            Spacer()
        }.background(Color.brown)
    }
}

struct VistaDatos_Previews: PreviewProvider {
    static var previews: some View {
        VistaDatos()
    }
}
