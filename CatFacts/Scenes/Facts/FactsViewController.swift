//
//  FactsViewController.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

protocol FactsDisplayLogic: class
{
  func displayFetchEntries(viewModel: Fact.FetchEntries.ViewModel)
  func displaySetIcon(viewModel: Fact.SetIcon.ViewModel)
}

class FactsViewController: UITableViewController, FactsDisplayLogic
{
  var interactor: FactsBusinessLogic?
  var router: (NSObjectProtocol & FactsRoutingLogic & FactsDataPassing)?

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
    let interactor = FactsInteractor()
    let presenter = FactsPresenter()
    let router = FactsRouter()
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
    fetchEntries()
  }
  
  // MARK: Table view
  
  override func numberOfSections(in tableView: UITableView) -> Int
  {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return displayedEntries.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let displayedEntry = displayedEntries[indexPath.row]
    var cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell") as? EntryCell
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: "EntryCell") as? EntryCell
    }
    cell!.displayedEntry = displayedEntry
    return cell!
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
  {
    // TODO: Route to detail view
  }
  
  // MARK: Fetch entries
  
  var displayedEntries = [Fact.DisplayedEntry]()
  
  func fetchEntries()
  {
    let request = Fact.FetchEntries.Request()
    interactor?.fetchEntries(request: request)
  }
  
  func displayFetchEntries(viewModel: Fact.FetchEntries.ViewModel)
  {
    displayedEntries = viewModel.displayedEntries
    tableView.reloadData()
  }
  
  // MARK: Set icon
  
  func entryCellButtonTapped(entryCell: EntryCell)
  {
    if let indexPath = tableView.indexPath(for: entryCell) {
      setIcon(at: indexPath)
    }
  }
  
  func setIcon(at indexPath: IndexPath)
  {
    let request = Fact.SetIcon.Request(viewController: self, indexPath: indexPath)
    interactor?.setIcon(request: request)
  }
  
  func displaySetIcon(viewModel: Fact.SetIcon.ViewModel)
  {
    displayedEntries[viewModel.indexPath.row] = viewModel.displayedEntry
    tableView.reloadRows(at: [viewModel.indexPath], with: .automatic)
  }
}
