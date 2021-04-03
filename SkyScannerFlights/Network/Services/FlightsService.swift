//
//  SSFlightList.swift
//  FlightsService
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation

/// Protocol to notify Success or Failure of the API call
protocol FlightsServiceDelegate {
  func didReciveResponse(response: Flights)
  func didReciveError(error: String)
}

/// ViewModel for handling the data required for   view
struct FlightsService
{
  var delegate:FlightsServiceDelegate?
  
  /// Function to make API call to get the  flight data
  func getFlightsData()
  {
    let network = NetworkManager()
    network.getData(method: .GET, endpoint: .flightsData, dictionary: nil, type: Flights.self) { (result) in
      switch result {
      case .Success(let result):
        delegate?.didReciveResponse(response: result)
      case .Error(let error):
        delegate?.didReciveError(error: error)
      }
    }
  }
}
