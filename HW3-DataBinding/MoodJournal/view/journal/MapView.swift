//
//  MapView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/4.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var journalViewModel: JournalViewModel
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.95)
                
                Spacer()
                
                Text("(\(region.center.latitude), \(region.center.longitude))")
                    .font(.title2)
            }
        }
        .onAppear {
            if let tag = journalViewModel.journals[journalViewModel.tag],
               let journal = tag[journalViewModel.id]
            {
                region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: journal.latitude, longitude: journal.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            }
        }
        .onDisappear {
            if let tag = journalViewModel.journals[journalViewModel.tag],
               let _ = tag[journalViewModel.id]
            {
                journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]?.latitude = region.center.latitude
                journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]?.longitude = region.center.longitude
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(journalViewModel: JournalViewModel())
    }
}
