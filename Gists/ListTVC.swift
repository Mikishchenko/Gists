//
//  ListTableViewController.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import UIKit

// MARK: - Глобальные переменные
var gistsList: [Gist]? = []
var commitList: [Commit]? = []
var currentGist: Gist?
var currentContent: String?
var nextRefresh = false

class ListTableViewController: UITableViewController {
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      tableView.reloadData()
   }
   
   // MARK: - TableViewDataSource
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      guard gistsList?.isEmpty == false  else { return 0 }
      return gistsList!.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListsCell",
                                                     for: indexPath) as? ListTableViewCell
         else { return UITableViewCell() }
      cell.gist = gistsList?[indexPath.row]
      return cell
   }   
   
   // MARK: - TableViewDelegate
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 72
   }
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      currentGist = gistsList?[indexPath.row]
      singleGistRequest((currentGist?.gistID)!)
   }
   
   // MARK: - Кнопка обновления таблицы
   @IBAction func refreshListButton(_ sender: UIBarButtonItem) {
      nextRefresh = !nextRefresh
      guard nextRefresh else { return tableView.reloadData() }
      gistsRequest()
      DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
         self.tableView.reloadData()
      })
   }
}
