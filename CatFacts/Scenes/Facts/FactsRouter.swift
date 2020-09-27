//
//  FactsRouter.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//


import UIKit

@objc protocol FactsRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol FactsDataPassing
{
  var dataStore: FactsDataStore? { get }
}

class FactsRouter: NSObject, FactsRoutingLogic, FactsDataPassing
{
  weak var viewController: FactsViewController?
  var dataStore: FactsDataStore?

}
