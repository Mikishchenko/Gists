//
//  DetailsViewController.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   //                           UIViewController, UITableViewDelegate, UITableViewDataSource
   // MARK: - Outlets
   @IBOutlet weak var userAvatarImage: UIImageView!
   @IBOutlet weak var gistNameLabel: UILabel!
   @IBOutlet weak var userNameLabel: UILabel!
   @IBOutlet weak var gistContentText: UITextView!
   @IBOutlet weak var commitsTableView: UITableView!
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      // вроде бы так чуть приятнее смотрится
      someCorrectObject(userAvatarImage)
      someCorrectObject(gistContentText)
      someCorrectObject(commitsTableView)
      // заполняем данными
      userAvatarImage.image = UIImage(data: (currentGist?.userAvatar)!)
      gistNameLabel.text = currentGist?.gistName
      userNameLabel.text = currentGist?.userName
      DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
         self.gistContentText.text = currentContent ??
         "Sorry ...\n\nLine is busy now.\n\nPlease go to GISTS LIST\nand comeback to this gist."
      })
   }
   
   // MARK: - TableViewDataSource
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
         tableView.reloadData()
   })
      guard commitList!.isEmpty == false  else { return 0 }
      return commitList!.count
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommitsCell",
                                                     for: indexPath) as? CommitTableViewCell
         else { return UITableViewCell() }
         cell.commit = commitList?[indexPath.row]
      return cell
   }
   
   // MARK: - TableViewDelegate
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 30
   }
}

// MARK: - Небольшие улучшения внешнего вида
func someCorrectObject(_ object: UIView) {
   object.layer.cornerRadius = 3
   object.layer.borderWidth = 1
   object.layer.borderColor = UIColor.black.cgColor
}
