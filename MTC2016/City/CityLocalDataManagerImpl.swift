//
//  CityLocalDataManagerImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation
import Common
import CoreData

class CityLocalDataManagerImpl: CityLocalDataManager {

  // CityLocalDataManager
  weak var interactor: CityLocalDataManagerOutput?
  var coreDataStack = CoreDataStack()
  var cities: [CityDB]?

  init() {
    loadCities()
  }

  private func loadCities() {
    do {
      cities = try coreDataStack.managedObjectContext.executeFetchRequest(citiesFetchRequest) as? [CityDB]
    } catch {
      cities = []
    }
  }

  private var citiesFetchRequest: NSFetchRequest {
    let fetchRequest = NSFetchRequest(entityName: CityDB.entityName)
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare))
    fetchRequest.sortDescriptors = [sortDescriptor]
    return fetchRequest
  }
}

// MARK: - CityLocalDataManagerInput
extension CityLocalDataManagerImpl: CityLocalDataManagerInput {

  func saveCity(city: City) {
    let cityDB = CityDB(context: coreDataStack.managedObjectContext)
    cityDB.city = city
    do {
      try coreDataStack.managedObjectContext.save()
      loadCities()
      interactor?.didSaveCity()
    } catch {
      interactor?.didFailSavingCity(error)
    }
  }

  func removeCityAtIndex(index: Int) {
    guard let cities = cities where index >= 0 && index < cities.count else {
      interactor?.didFailRemovingCity(nil)
      return
    }

    let city = cities[index]
    coreDataStack.managedObjectContext.deleteObject(city)
    loadCities()
    interactor?.didRemoveCity()
  }

  func cityAtIndex(index: Int) -> City? {
    guard let cities = cities where index >= 0 && index < cities.count else {
      return nil
    }
    return cities[index].city
  }

  func countOfCities() -> Int {
    return cities?.count ?? 0
  }
}
