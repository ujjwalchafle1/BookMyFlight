//
//  SkyScannerFlightsTests.swift
//  SkyScannerFlightsTests
//
//  Created by Ujjwal on 17/03/2021.
//

import XCTest
@testable import SkyScannerFlights

class when_the_departure_date_is_available: XCTestCase {

    var sampleDate = "2020-10-31T15:35"
  
   func check_date_formate()
   {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "HH:mm"
    
    if let date = dateFormatterGet.date(from: sampleDate) {
      XCTAssertEqual("15:356", dateFormatterPrint.string(from: date))
    }
   }
}
