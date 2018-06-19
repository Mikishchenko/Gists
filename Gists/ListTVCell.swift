//
//  ListTableViewCell.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
   
   // MARK: - Outlets
   @IBOutlet weak var userAvatarImage: UIImageView!
   @IBOutlet weak var gistNameLabel: UILabel!
   @IBOutlet weak var userNameLabel: UILabel!
   
   // MARK: - Properties
   var gist: Gist? {
      didSet {
         guard let gist = gist else { return }
         guard gist.userAvatar != nil else { return }
         userAvatarImage.image = UIImage(data: gist.userAvatar!)
         guard gist.gistName != nil else { return }
         gistNameLabel.text = gist.gistName
         guard gist.userName != nil else { return }
         userNameLabel.text = gist.userName
      }
   }
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
}
