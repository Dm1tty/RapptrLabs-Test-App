
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation
import Alamofire

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    

    func fetchChatData(completion: @escaping ([Message]) -> Void, error errorHandler: @escaping (String?) -> Void) {
        guard let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php") else { return }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in

                guard let data = data, error == nil else { return }

                do {
                    // make sure this JSON is in the format we expect
                    // convert data to json
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // try to read out a dictionary
                       // print(json)
                        if let data = json["data"] as? [[String:Any]] {
                            var messages = [Message]()
                            for message in data{
                                var addMessage = Message(testName: message["name"] as! String, withTestMessage: message["message"] as! String)
                                addMessage.userID = message["user_id"] as! String
                                addMessage.avatarURL = message["avatar_url"] as! String
                                
                                messages.append(addMessage)
                            }
                                completion(messages)
                        }
                    }
                } catch let error as NSError {
                    errorHandler(error.localizedDescription)
                }

            }

            task.resume()
    }
}

