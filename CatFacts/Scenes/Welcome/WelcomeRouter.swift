//
//  WelcomeRouter.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

@objc protocol WelcomeRoutingLogic
{
  func routeToFacts(segue: UIStoryboardSegue?)
}

protocol WelcomeDataPassing
{
  var dataStore: WelcomeDataStore? { get }
}

class WelcomeRouter: NSObject, WelcomeRoutingLogic, WelcomeDataPassing
{
  weak var viewController: WelcomeViewController?
  var dataStore: WelcomeDataStore?
  
  // MARK: Routing
  
  func routeToFacts(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! FactsViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToFacts(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "FactsViewController") as! FactsViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToFacts(source: dataStore!, destination: &destinationDS)
      navigateToFacts(source: viewController!, destination: destinationVC)
    }
  }

  // MARK: Navigation
  
  func navigateToFacts(source: WelcomeViewController, destination: FactsViewController)
  {
  }
  
  // MARK: Passing data
  
  func passDataToFacts(source: WelcomeDataStore, destination: inout FactsDataStore)
  {
  }
}
