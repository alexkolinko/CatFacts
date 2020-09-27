//
//  FactsWorker.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

class FactsWorker
{
  let entries: [Entry] = [
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!),
    Entry(text: "Cat facts", icon: UIImage(named: "maxresdefault")!)
  ]
  
  func fetchEntries(completionHandler: ([Entry]) -> Void)
  {
    completionHandler(entries)
  }
}
