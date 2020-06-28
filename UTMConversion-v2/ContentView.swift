//
//  ContentView.swift
//  UTMConversion-v2
//
//  Created by Sam Dravizki on 28/06/20.
//  Copyright © 2020 Sam Dravizki. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    var body: some View {
        VStack {
            ZStack {
                MapView(centerCoordinate: $centerCoordinate)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
            }
            
            VStack {
                Text("WGS48")
                HStack {
                    Text("Coordinates")
                    Text("\(centerCoordinate.longitude), \(centerCoordinate.latitude)")
                    .frame(width: 200)
                }
                .padding(.bottom)
                
                Text("UTM")
                
                HStack {
                    Text("Zone")
                    Text(UTMZoneFromWGS48(longitude: centerCoordinate.longitude, latitude: centerCoordinate.latitude))
                    .frame(width: 200)
                }
                HStack {
                    Text("Coordinates")
                    Text("\(centerCoordinate.longitude), \(centerCoordinate.latitude)")
                    .frame(width: 200)
                }
            }
            
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
