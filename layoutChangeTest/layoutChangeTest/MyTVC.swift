//
//  ViewController.swift
//  layoutChangeTest
//
//  Created by Eric on 7/28/16.
//  Copyright © 2016 Simple Guy. All rights reserved.
//

import UIKit

class MyTVC: UITableViewController {


  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
  }
  
  // 1 section, many rows
  override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 27 }
  
  // unicode char by row index
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell") else { return UITableViewCell() }
    let idx = indexPath.row + 64
    cell.textLabel?.text =  String(idx)
    cell.textLabel?.textColor = UIColor.lightGray()
    cell.detailTextLabel?.text = String(Character(UnicodeScalar(idx)))
    return cell
  }
  
}

