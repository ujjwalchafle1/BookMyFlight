//
//  SSFlightList.swift
//  FlightsAPI
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation

/// Use this enum to create base url and endpoint path
/// Add additional cases for future API services
enum FlightsAPI {
  case flightsData
}

/// Create base url and path components based on the enum case.
extension FlightsAPI: EndpointType
{
  var baseURL: URL {
    switch self {
    case .flightsData :
      return URL(string: "https://s3-eu-west-1.amazonaws.com/")!
    }
  }
  
  var path: String {
    switch self {
    case .flightsData :
      return "skyscanner-prod-takehome-test/flights.json"
    }
  }
  
}
