//
//  FactsModels.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

struct Entry
{
  var text: String
  var icon: UIImage
}

enum Fact
{
  struct DisplayedEntry
  {
    var text: String
    var icon: UIImage
  }
  
  // MARK: Use cases
  
  enum FetchEntries
  {
    struct Request
    {
    }
    struct Response
    {
      var entries: [Entry]
    }
    struct ViewModel
    {
      var displayedEntries: [DisplayedEntry]
    }
  }
  
  enum SetIcon
  {
    struct Request
    {
      let viewController: UIViewController
      var indexPath: IndexPath
    }
    struct Response
    {
      var entry: Entry
      var indexPath: IndexPath
    }
    struct ViewModel
    {
      var displayedEntry: DisplayedEntry
      var indexPath: IndexPath
    }
  }
}
