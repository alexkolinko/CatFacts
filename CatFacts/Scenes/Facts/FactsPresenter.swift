//
//  FactsPresenter.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//


import UIKit

protocol FactsPresentationLogic
{
  func presentSetIcon(response: Fact.SetIcon.Response)
  func presentFetchEntries(response: Fact.FetchEntries.Response)
}

class FactsPresenter: FactsPresentationLogic
{
  weak var viewController: FactsDisplayLogic?
  
  // MARK: Fetch entries
  
  func presentFetchEntries(response: Fact.FetchEntries.Response)
  {
    let displayedEntries = response.entries.map { convert(entry: $0) }
    
    let viewModel = Fact.FetchEntries.ViewModel(displayedEntries: displayedEntries)
    viewController?.displayFetchEntries(viewModel: viewModel)
  }
  
  // MARK: Set icon
  
  func presentSetIcon(response: Fact.SetIcon.Response)
  {
    let displayedEntry = convert(entry: response.entry)
    let viewModel = Fact.SetIcon.ViewModel(displayedEntry: displayedEntry, indexPath: response.indexPath)
    viewController?.displaySetIcon(viewModel: viewModel)
  }
  
  // MARK: Format entry to displayed entry
  
  private func convert(entry: Entry) -> Fact.DisplayedEntry
  {
    let text = entry.text
    let icon = entry.icon
    return Fact.DisplayedEntry(text: text, icon: icon)
  }
}

