//
//  WelcomeViewController.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

protocol WelcomeDisplayLogic: class
{
  func displayFacts()
}

class WelcomeViewController: UIViewController, WelcomeDisplayLogic
{
  var interactor: WelcomeBusinessLogic?
  var router: (NSObjectProtocol & WelcomeRoutingLogic & WelcomeDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = WelcomeInteractor()
    let presenter = WelcomePresenter()
    let router = WelcomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
  
  // MARK: Facts
  
  @IBAction func catFactsButtonTapped(_ sender: UIButton)
  {
    catFacts()
  }
  
  func catFacts()
  {
    interactor?.catFactsSeg()
  }
  
  func displayFacts()
  {
      performSegue(withIdentifier: "FactsView", sender: nil)
  }
}
