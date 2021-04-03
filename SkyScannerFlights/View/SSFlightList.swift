//
//  SSFlightList.swift
//  SkyScannerFlights
//
//  Created by Ujjwal on 17/03/2021.
//

import SwiftUI

struct SSFlightList: View {
  
  @ObservedObject var viewModel: FlightViewModel
  
  init(vm: FlightViewModel = FlightViewModel()) {
    viewModel = vm
  }
  
  var body: some View
  {
    List{
      
      ForEach(viewModel.itineraries, id: \.id) { flight in
        
        Section
        {
          GroupBox()
          {
            ForEach(viewModel.getFlightsFromId(legIds: flight.legs), id: \.id) { leg in
              
              HStack
              {
                Image(systemName: "photo")
                  .padding(20)
                
                VStack(alignment:.leading)
                {
                  
                  Text("\(leg.formatedDepartureTime) - \(leg.formatedArrivalTime)")
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                    .padding(2)
                  
                  Text("\(leg.departureAirport)-\(leg.arrivalAirport), \(leg.airlineName)")
                    .fontWeight(.light)
                    .font(.system(size: 15))
                  
                }
                
                Spacer()
                
                VStack(alignment:.trailing)
                {
                  Text(leg.stopsInTrip)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                    .padding(2)
                  
                  Text(leg.durationInHours)
                    .fontWeight(.light)
                    .font(.system(size: 15))
                  
                }
              }
            }
            
            Divider()
            
            HStack
            {
              Spacer()
              VStack(alignment:.trailing){
                Text(flight.price)
                Text("via " + flight.agent)
                
              }
            }
          }
        }
      }
    }
  }
  
}

