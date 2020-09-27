//
//  EntryCell.swift
//  CatFacts
//
//  Created by Alexandr on 27.09.2020.
//

import UIKit


class EntryCell: UITableViewCell
{
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
  var displayedEntry: Fact.DisplayedEntry?
  {
    didSet
    {
      label.text = displayedEntry?.text
        catImage.image = displayedEntry?.icon
    }
  }
}
