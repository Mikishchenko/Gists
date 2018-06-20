//
//  SingleGistData.swift
//  Gists
//
//  Created by Владимир Микищенко on 19.06.2018.
//  Copyright © 2018 Vladimir Mikishchenko. All rights reserved.
//

import Foundation

// MARK: - Получение данных с сервера о конкретном гисте
public func singleGistRequest(_ gistID: String) {
   
   // очищаем массив комитов (для каждого нового гиста он должен быть пуст)
   commitList?.removeAll()
   
   // готовим url к запросу
   let mainURL = URLComponents(string: "https://api.github.com/gists/" + gistID)
   
   let task = URLSession.shared.dataTask(with: (mainURL?.url!)!) { (data, response, error) in
      // проверки корректности полученного ответа
      guard let data = data, let httpResponse = response as? HTTPURLResponse,
         httpResponse.statusCode == 200, error == nil else {
            print(String(describing: response))
            print(String(describing: error))
            return
      }
      guard let json = try! JSONSerialization.jsonObject(with: data) as? [String: Any] else {
         print("not JSON format expected")
         print(String(data: data, encoding: .utf8) ?? "No data")
         return
      }
      // получаем gistContent
      let files = json["files"] as? [String: Any]
      let fileName = files?.first?.value as? [String: Any]
      let content = fileName!["content"] as? String
//      print (content ?? "No content")
      // сохраняем полученные значения content
      DispatchQueue.main.async {
         currentContent = content!
      }
      // получаем history
      let history = json["history"] as? [[String: Any]]
//      print("***** history.count = \(history!.count) *****")
      for i in 0...history!.count - 1 {
//         print(history?[i] ?? "No history")
         // получаем commitsDate
         let commitsDate = history?[i]["committed_at"] as? String
//         print(commitsDate ?? "No commit date")
         // получаем additions
         let changeStatus = history?[i]["change_status"] as? [String: Any]
//         print(changeStatus ?? "No change status")
         let additions = changeStatus!["additions"] as? Int
//         print(additions ?? "No additios")
         // получаем deletions
         let deletions = changeStatus!["deletions"] as? Int
//         print(deletions ?? "No deletions")
         let commit = Commit(commitsDate: commitsDate ?? "No date", additions: UInt(additions ?? 0),
                             deletions: UInt(deletions ?? 0))
         // сохраняем полученные значения
         commitList?.append(commit)
      }
   }
   task.resume()
}
