//
//  Gist.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import Foundation

protocol GistProtocol {
   var userAvatar: Data? {get set}
   var gistName: String? {get set}
   var userName: String? {get set}
   var gistID: String? {get set}
}

class Gist: GistProtocol {
   var userAvatar: Data?
   var gistName: String?
   var userName: String?
   var gistID: String?
   
   init(userAvatar: Data, gistName: String, userName: String, gistID: String) {
      
      self.userAvatar = userAvatar
      self.gistName = gistName
      self.userName = userName
      self.gistID = gistID
   }
}
