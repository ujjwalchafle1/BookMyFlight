//
//  SSFlightList.swift
//  EndpointType
//
//  Created by Ujjwal on 17/03/2021.
//

import Foundation

/// Protocol to implement for url creation
protocol EndpointType
{
  var baseURL: URL { get }
  var path: String { get }
}
