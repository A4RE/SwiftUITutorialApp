//
//  MapView.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var regionCoordinate = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $regionCoordinate)
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        regionCoordinate = MKCoordinateRegion(
        center: coordinate,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
