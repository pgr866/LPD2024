import SwiftUI
import MapKit

struct VistaMapa: View {
    var latitud: Double
    var longitud: Double
    @State private var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $region)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
            .onAppear(){
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: latitud, longitude: longitud),
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            }
    }
}
