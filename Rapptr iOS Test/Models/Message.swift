//
//  Message.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

struct ReceivedMessages: Decodable {
    let data: [Message]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
      }
}

// MARK: - Datum
struct Message: Decodable {
    
    var userID: String?
    var name: String
    var avatarURL: String?
    var message: String
    
    init(testName: String, withTestMessage message: String) {
        self.userID = "0"
        self.name = testName
        self.avatarURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png"
        self.message = message

}



}





