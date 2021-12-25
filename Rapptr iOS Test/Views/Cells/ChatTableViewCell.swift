//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var messageView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // MARK: - Setting Up Cell
        self.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        messageView.backgroundColor = UIColor(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, alpha: 1.0)
        
        // MARK: - Chat - User Name
        header.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        header.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
        
        // MARK: - Chat - Message
        body.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
        body.font = UIFont.systemFont(ofSize: 15, weight: .regular)

        // MARK: - Anchors
        avatarImage.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 16, paddingLeft: 16, width: 60, height: 60)
        header.anchor(top: self.topAnchor, left: avatarImage.rightAnchor, paddingTop: 24 ,paddingLeft: 7, height: 13)
        body.anchor(top: self.contentView.topAnchor, left: avatarImage.rightAnchor, bottom: self.contentView.bottomAnchor, right: self.rightAnchor, paddingTop: 49, paddingLeft: 10, paddingBottom: 8, paddingRight: 44)
        messageView.anchor(top: body.topAnchor, left: body.leftAnchor, bottom: body.bottomAnchor, right: body.rightAnchor, paddingTop: -8, paddingLeft: -8, paddingBottom: -8, paddingRight: -8)
        
        
        messageView.layer.cornerRadius = 8
        messageView.layer.masksToBounds = true
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.name
        body.text = message.message
        avatarImage.downloaded(from: message.avatarURL ?? "")
        avatarImage.setRounded()
    }
}
