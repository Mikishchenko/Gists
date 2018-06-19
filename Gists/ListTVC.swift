//
//  ListTableViewController.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import UIKit

var gistsList: [Gist]? = []
var currentGist: Gist?

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
   // MARK: - TableViewDataSource
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      guard gistsList?.isEmpty == false  else { return 0 }
      return gistsList!.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "ListsCell",
                                                  for: indexPath) as? ListTableViewCell {
         cell.gist = gistsList?[indexPath.row]
         return cell
      }
      return UITableViewCell()
   }
   
   // MARK: - TableViewDelegate
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 72
   }
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      currentGist = gistsList?[indexPath.row]
   }
   
   // MARK: - Кнопка получения данных с сервера
   @IBAction func addGistsButton(_ sender: UIBarButtonItem) {
      gistsRequest()
   }
   
   // MARK: - Кнопка обновления таблицы
   @IBAction func refreshListButton(_ sender: UIBarButtonItem) {
      tableView.reloadData()
   }
   
}
