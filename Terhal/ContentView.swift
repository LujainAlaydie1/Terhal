//
//  ContentView.swift
//  Terhal
//
//  Created by Lujain Alaydie on 22/01/2024.
//

import SwiftUI
import SwiftData
@_spi(Experimental) import MapboxMaps

struct ContentView: View {
    var body: some View {
        // As SwiftUI support is experimental it needs to be imported with @_spi(Experimental)
        // The API may change in future releases.
        let center = CLLocationCoordinate2D(latitude: 39.5, longitude: -98.0)
        Map(initialViewport: .camera(center: center, zoom: 2, bearing: 0, pitch: 0))
        .ignoresSafeArea()
        }
    }




class ViewController: UIViewController {
    // This controller's initialization has been omitted in this code snippet
    var mapView: MapView!
    // A location provider that you use to customize location settings.
    let locationProvider = AppleLocationProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MapView()
        // Override the default location provider with the custom one.
        mapView.location.override(provider: locationProvider)
        locationProvider.delegate = self
    }

    // Method that will be called as a result of the delegate below
    func requestPermissionsButtonTapped() {
        locationProvider.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "CustomKey")
    }
}

extension ViewController: AppleLocationProviderDelegate {
    func appleLocationProvider(_ locationProvider: MapboxMaps.AppleLocationProvider, didFailWithError error: Error) {
        if error != nil {
         // Perform an action in response to the error in accuracy
            print(error.localizedDescription)
        }
    }
    
    func appleLocationProvider(_ locationProvider: MapboxMaps.AppleLocationProvider, didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization) {
        if accuracyAuthorization == .reducedAccuracy {
         // Perform an action in response to the new change in accuracy
        }
        
    }
    
    func appleLocationProviderShouldDisplayHeadingCalibration(_ locationProvider: MapboxMaps.AppleLocationProvider) -> Bool {
        return true
    }
    
}

#Preview {
    ContentView()
}
