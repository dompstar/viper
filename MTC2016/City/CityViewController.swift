//
//  CityViewController.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation
import UIKit
import Common

class CityViewController: UITableViewController, CityUserInterface {

  // CityUserInterface
  var presenter: CityPresenterInput!
  private let cellIdentifier = "CityCell"

  // MARK: - ViewController lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = CityStrings.moduleName
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    presenter.userInterfaceReady()
  }

  @IBAction func didSelectAddButton(sender: UIBarButtonItem) {
    // Show textfield
    let textAlertController = UIAlertController(title: CityStrings.addCityAlertTitle, message: CityStrings.addCityAlertMessage, preferredStyle: .Alert)
    textAlertController.addTextFieldWithConfigurationHandler(nil)
    let addAction = UIAlertAction(title: CityStrings.addCityAlertAddButtonTitle, style: .Default) { _ in
      if let cityText = textAlertController.textFields?.first?.text {
        self.presenter.handleAddCityActionWithName(cityText)
      }
    }
    let cancelAction = UIAlertAction(title: CityStrings.addCityAlertCancelButtonTitle, style: .Cancel, handler: nil)
    textAlertController.addAction(addAction)
    textAlertController.addAction(cancelAction)
    presentViewController(textAlertController, animated: true, completion: nil)
  }

}

extension CityViewController {

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    presenter.handleCitySelectionAtIndex(indexPath.row)
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.countOfCities()
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
    cell.textLabel?.text = presenter.cityNameAtIndex(indexPath.row)
    return cell
  }

  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      presenter.handleRemoveCityAtIndex(indexPath.row)
    }
  }
}


// MARK: - CityPresenterOutput
extension CityViewController: CityPresenterOutput {

  func showError(errorText: String) {
    let alertController = UIAlertController(title: CityStrings.errorAlertTitle, message: errorText, preferredStyle: .Alert)
    let confirmAction = UIAlertAction(title: CityStrings.errorAlertConfirmButtonTitle, style: .Default, handler: nil)
    alertController.addAction(confirmAction)
    presentViewController(alertController, animated: true, completion: nil)
  }

  func refreshView() {
    tableView.reloadData()
  }
}
