//
//  ViewController.swift
//  tableViewSelectionModes
//
//  Created by Eric on 8/19/16.
//  Copyright © 2016 Simple Guy. All rights reserved.
//

import UIKit

class MyTVC: UITableViewController {

  private var data = Array(0...42)
  
  
  
  // MARK: View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.allowsSelection = true // This only applies to single-select, or Normal/Navigation mode in this demo
  }
  
  
  
  // MARK: UI Modes & Methods
  // Note: order of these enum cases must match the order of the UISegmentedControl. Fragile, but ok for a demo
  enum SelectionMode: Int {
    case none
    case promote
    case delete
  }
  private var selectionMode: SelectionMode = .none { didSet {
    if oldValue == selectionMode { return }
    print("selectionMode didSet \(selectionMode)")
    
    switch selectionMode {
    case .none:
      tableView.setEditing(false, animated: true)
    case .promote:
      tableView.setEditing(true, animated: true)
      tableView.allowsMultipleSelectionDuringEditing = true
    case .delete:
      tableView.setEditing(true, animated: true)
      tableView.allowsMultipleSelectionDuringEditing = false
    }
    
    if let visible = tableView.indexPathsForVisibleRows {
      tableView.reloadRows(at: visible, with: .automatic) // tells the tableView to ask for editingStyleForRowAt
    }
    navigationItem.title = currentTitle
  }}
  private var currentTitle: String {
    switch selectionMode {
    case .none: return "Navigate to Item"
    case .promote: return String(format: "Promote %d Items", tableView.indexPathsForSelectedRows?.count ?? 0)
    case .delete: return "Delete Items"
    }
  }
  @IBAction func onChangeSelectionType(_ sender: UISegmentedControl) {
    selectionMode = SelectionMode(rawValue: sender.selectedSegmentIndex) ?? .none
  }
  
  
  
  // MARK: Basic Table View dataSource & delegate Conformance
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
    cell.selectionStyle = .default // without this, you will not see the UI update to reflect selection state
    cell.textLabel?.text = String(data[indexPath.row])
    return cell
  }
  
  
  
  // MARK: Promotion Selection Code
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //print("didSelectRowAt \(indexPath) selected: \(tableView.indexPathsForSelectedRows)")
    navigationItem.title = currentTitle
  }
  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    navigationItem.title = currentTitle
  }
  
  
  
  // MARK: Deletion Code
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    return .delete // no branching is needed because this method is not even called if `allowsMultipleSelectionDuringEditing` is true
  }
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      data.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }

}
