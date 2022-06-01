//
//  DiskCacheManager.swift
//  notificationSalimovAzizbek
//
//  Created by Azizbek Salimov on 01.06.2022.
//

import Foundation

class DiskCacheManager {
  let groupIdentifier = "com.notificationSalimovAzizbek"
  let databaseName = "Wendercast.sqlite"
  
  var groupDirectoryLocation: URL {
    guard let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier) else {
      preconditionFailure("Invalid group configuration")
    }
    
    return containerURL
  }
  
  var databaseURL: URL {
    return groupDirectoryLocation.appendingPathComponent(databaseName)
  }
}
