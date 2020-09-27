//
//  WelcomeInteractor.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

protocol WelcomeBusinessLogic
{
  func catFactsSeg()
}

protocol WelcomeDataStore
{
}

class WelcomeInteractor: WelcomeBusinessLogic, WelcomeDataStore
{
  var presenter: WelcomePresentationLogic?
  var worker: WelcomeWorker?
  
  // MARK: Cat Facts
  
  func catFactsSeg()
  {
      presenter?.presentFacts()
  }
}
