import SwiftUI
import MapKit

struct VistaMapa: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.897003,
                                       longitude: -77.036549),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(width: 350)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
    }
}

struct VistaMapa_Previews: PreviewProvider {
    static var previews: some View {
        VistaMapa()
    }
}
