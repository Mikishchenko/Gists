//
//  CommitTableViewCell.swift
//  Gists
//
//  Created by Владимир Микищенко on 20.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import UIKit

class CommitTableViewCell: UITableViewCell {
   
   // MARK: - Outlets   
   @IBOutlet weak var commitsDateLabel: UILabel!
   @IBOutlet weak var additionsLabel: UILabel!
   @IBOutlet weak var deletionsLabel: UILabel!
   
   // MARK: - Properties
   var commit: Commit? {
      didSet {
         guard let commit = commit else { return }
         guard commit.commitsDate != nil else { return }
         
         // конвертирование полученной даты из String в Date
         let dateFormatter = ISO8601DateFormatter()
         guard let newDate = dateFormatter.date(from: commit.commitsDate!)
            else { return print("Неудача с конвертированием даты коммита")}
         commitsDateLabel.text = String(describing: newDate)
         
         guard commit.additions != nil else { return }
         additionsLabel.text = String(describing: commit.additions ?? 0)
         guard commit.deletions != nil else { return }
         deletionsLabel.text = String(describing: commit.deletions ?? 0)
      }
   }
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
}
