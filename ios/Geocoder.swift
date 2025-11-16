// Copyright 2024-present 650 Industries. All rights reserved.

import CoreLocation

internal struct Geocoder {
  static func geocode(address: String) async throws -> [[String: Any?]] {
    do {
      let geocoder = CLGeocoder()
      let placemarks = try await geocoder.geocodeAddressString(address)

      return placemarks.map { placemark in
        let location = placemark.location
        let altitudeValue: CLLocationDistance?
        if #available(iOS 15.0, *) {
          console.log("Using ellipsoidalAltitude")
          altitudeValue = location?.ellipsoidalAltitude
        } else {
          altitudeValue = location?.altitude
        }
        return [
          "latitude": location?.coordinate.latitude,
          "longitude": location?.coordinate.longitude,
          "altitude": altitudeValue,
          "accuracy": location?.horizontalAccuracy
        ]
      }
    } catch {
      return try handleCLError(error: error as NSError, defaultValue: [])
    }
  }

  static func reverseGeocode(location: CLLocation) async throws -> [[String: Any?]] {
    do {
      let geocoder = CLGeocoder()
      let placemarks = try await geocoder.reverseGeocodeLocation(location)

      return placemarks.map { placemark in
        return [
          "city": placemark.locality,
          "district": placemark.subLocality,
          "streetNumber": placemark.subThoroughfare,
          "street": placemark.thoroughfare,
          "region": placemark.administrativeArea,
          "subregion": placemark.subAdministrativeArea,
          "country": placemark.country,
          "postalCode": placemark.postalCode,
          "name": placemark.name,
          "isoCountryCode": placemark.isoCountryCode,
          "timezone": placemark.timeZone?.identifier
        ]
      }
    } catch {
      return try handleCLError(error: error as NSError, defaultValue: [])
    }
  }
}
