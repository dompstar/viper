//
//  City.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import Foundation


public struct City {
  
  public let identifier: String
  public let name: String
  
  public init(identifier: String = NSUUID().UUIDString, name: String) {
    self.identifier = identifier
    self.name = name
  }
}