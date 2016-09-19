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
import RealmSwift

class CityRealmLocalDataManagerImpl: CityLocalDataManager {

  // CityLocalDataManager
  weak var interactor: CityLocalDataManagerOutput?
  var realm: Realm {
      return try! Realm()
  }
  lazy var citiesResults: Results<CityRealm> = {
    return self.realm.objects(CityRealm).sorted("name", ascending: false)
  }()
}

// MARK: - CityLocalDataManagerInput
extension CityRealmLocalDataManagerImpl: CityLocalDataManagerInput {

  func saveCity(city: City) {
    do {
      try realm.write {
        let cityRealm = CityRealm(city: city)
        self.realm.add(cityRealm)
        self.interactor?.didSaveCity()
      }
    } catch {
      self.interactor?.didFailSavingCity(error)
    }
  }

  func removeCityAtIndex(index: Int) {
    guard index >= 0 && index < citiesResults.count else {
      return
    }
    do {
      try realm.write {
        self.realm.delete(self.citiesResults[index])
        self.interactor?.didRemoveCity()
      }
    } catch {
      self.interactor?.didFailRemovingCity(error)
    }
  }

  func cityAtIndex(index: Int) -> City? {
    guard index >= 0 && index < citiesResults.count else {
      return nil
    }
    return citiesResults[index].city
  }

  func countOfCities() -> Int {
    return citiesResults.count ?? 0
  }
}
