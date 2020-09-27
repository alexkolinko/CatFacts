//
//  FactsInteractor.swift
//  CatFacts
//
//  Created by Alexandr on 26.09.2020.
//

import UIKit

protocol FactsBusinessLogic
{
  func setIcon(request: Fact.SetIcon.Request)
  func fetchEntries(request: Fact.FetchEntries.Request)
}

protocol FactsDataStore
{
}

class FactsInteractor: NSObject, FactsBusinessLogic, FactsDataStore, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
  var presenter: FactsPresentationLogic?
  var worker = FactsWorker()
  
  // MARK: Fetch entries
  
  private var entries = [Entry]()
  
  func fetchEntries(request: Fact.FetchEntries.Request)
  {
    worker.fetchEntries { (entries) in
      self.entries = entries
      let response = Fact.FetchEntries.Response(entries: entries)
      presenter?.presentFetchEntries(response: response)
    }
  }
  
  // MARK: Set icon
  
  private var indexPath: IndexPath?
  
  func setIcon(request: Fact.SetIcon.Request)
  {
    indexPath = request.indexPath
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true
    picker.delegate = self
    request.viewController.present(picker, animated: true)
  }
  
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
  {
    picker.dismiss(animated: true)
    guard let image = info[UIImagePickerController.InfoKey.editedImage.rawValue] as? UIImage else { return }
    
    var entry = entries[indexPath!.row]
    entry.icon = image
    
    // TODO: Persist the image
    
    let response = Fact.SetIcon.Response(entry: entry, indexPath: indexPath!)
    presenter?.presentSetIcon(response: response)
  }
}

