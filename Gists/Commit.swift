//
//  Commit.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import Foundation

protocol CommitProtocol {
   var commitsDate: String? {get set}
   var additions: UInt? {get set}
   var deletions: UInt? {get set}
}

class Commit: CommitProtocol {
   var commitsDate: String?
   var additions: UInt?
   var deletions: UInt?
   
   init(commitsDate: String, additions: UInt, deletions: UInt) {
      self.commitsDate = commitsDate
      self.additions = additions
      self.deletions = deletions
   }
}
