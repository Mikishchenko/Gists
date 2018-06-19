//
//  DetailsViewController.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
   
   // MARK: - Outlets
   @IBOutlet weak var userAvatarImage: UIImageView!
   @IBOutlet weak var gistNameLabel: UILabel!
   @IBOutlet weak var userNameLabel: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      userAvatarImage.image = UIImage(data: (currentGist?.userAvatar)!)
      gistNameLabel.text = currentGist?.gistName
      userNameLabel.text = currentGist?.userName
   }
}
