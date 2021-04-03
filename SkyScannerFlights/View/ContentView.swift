//
//  ContentView.swift
//  SkyScannerFlights
//
//  Created by Ujjwal on 17/03/2021.
//

import SwiftUI

struct ContentView: View
{
  var body: some View {
    NavigationView{
      SSFlightList()
        .navigationTitle("Flights")
    }
  }
}
