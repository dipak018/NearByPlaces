//
//  Float+Ext.swift
//  NearByVenues
//
//  Created by Chaudhari, Dipak Bharat (external - Project) on 16/07/22.
//

import Foundation

extension Float {
  func getMiles() -> String {
      return String(format: "%.2f", (self * 0.000621371192))
       
//      return self * 0.000621371192
  }
  func getMeters() -> Float {
       return self * 1609.344
  }
}
