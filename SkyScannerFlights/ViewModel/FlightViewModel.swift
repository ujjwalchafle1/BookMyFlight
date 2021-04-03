//
//  CSReortViewModel.swift
//  FlightViewModel
//
//  Created by Chafle, Ujjwal on 02/03/2021.
//

import Foundation
import UIKit
import SwiftUI

/// ViewModel for handling the data required for  view
class FlightViewModel:ObservableObject
{
  
  // MARK:- Published properties
  @Published var itineraries: [Itinerary] = []
  @Published var legsArr: [Leg] = []
  
  
  // MARK:- Private properties
  
  private var service = FlightsService()
  
  init() {
    self.getFlightsData()
  }
  
  func getFlightsData()
  {
    service.delegate = self
    service.getFlightsData()
  }
  
  func getFlightsFromId(legIds : [String]) -> [Leg]
  {
    var legs:[Leg] = []
    for i in legIds
    {
      for j in legsArr{
        if j.id == i {
          legs.append(j)
        }
      }
    }
    return legs
  }
}

// MARK:- Extension to implement the FlightstService Delegate methods

extension FlightViewModel: FlightsServiceDelegate {
  
  func didReciveResponse(response: Flights) {
    DispatchQueue.main.async {
      self.itineraries = response.itineraries
      self.legsArr = response.legs
    }
  }
  
  func didReciveError(error: String) {
    print(error)
  }

}
