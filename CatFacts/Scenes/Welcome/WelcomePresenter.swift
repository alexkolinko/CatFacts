//
//  WelcomePresenter.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

protocol WelcomePresentationLogic
{
  func presentFacts()
}

class WelcomePresenter: WelcomePresentationLogic
{
  weak var viewController: WelcomeDisplayLogic?
  
  // MARK: Facts
  
  func presentFacts()
  {
    viewController?.displayFacts()
  }
}
