//
//  SSFlightList.swift
//  Flights
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation

// MARK: - Flight
struct Flights: Codable {
  let itineraries: [Itinerary]
  let legs: [Leg]
}

// MARK: - Itinerary
struct Itinerary: Codable, Identifiable {
  let id: String
  let legs: [String]
  let price, agent: String
  let agentRating: Double
  
  enum CodingKeys: String, CodingKey {
    case id, legs, price, agent
    case agentRating = "agent_rating"
  }
}

// MARK: - Leg
struct Leg: Codable, Identifiable {
  let id, departureAirport, arrivalAirport, departureTime: String
  let arrivalTime: String
  let stops: Int
  let airlineName, airlineID: String
  let durationMins: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case departureAirport = "departure_airport"
    case arrivalAirport = "arrival_airport"
    case departureTime = "departure_time"
    case arrivalTime = "arrival_time"
    case stops
    case airlineName = "airline_name"
    case airlineID = "airline_id"
    case durationMins = "duration_mins"
  }
  
  var formatedDepartureTime: String {
    get {
      let dateFormatterGet = DateFormatter()
      dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm"
      
      let dateFormatterPrint = DateFormatter()
      dateFormatterPrint.dateFormat = "HH:mm"
      
      if let date = dateFormatterGet.date(from: departureTime) {
        return dateFormatterPrint.string(from: date)
      }
      return ""
    }
  }
  
  var formatedArrivalTime: String {
    get {
      let dateFormatterGet = DateFormatter()
      dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm"
      
      let dateFormatterPrint = DateFormatter()
      dateFormatterPrint.dateFormat = "HH:mm"
      
      if let date = dateFormatterGet.date(from: arrivalTime) {
        return dateFormatterPrint.string(from: date)
      }
      return ""
    }
  }
  
  var durationInHours: String {
    get {
      "\(durationMins / 60)h \(durationMins % 60)m"
    }
  }
  
  var stopsInTrip: String {
    get {
      if stops == 0 {
        return "Direct"
      } else {
        return stops > 1 ? "\(stops) Stops" : "\(stops) Stop"
      }
    }
  }
  
}
