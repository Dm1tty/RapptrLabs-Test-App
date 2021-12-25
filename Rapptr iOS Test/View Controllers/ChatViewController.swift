//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - Properties
    private var client: ChatClient?
    private var messages: [Message]?
    
    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        messages = [Message]()
        configureTable(tableView: chatTable)
        title = "Chat"
        
        client = ChatClient()
        
        client?.fetchChatData(completion: { message in
            self.messages?.removeAll()
            self.messages = message
            
            DispatchQueue.main.async {
                self.chatTable.reloadData()
            }
        },
            error: { error in
                print(error)
        })
        
        
        // TODO: Remove test data when we have actual data from the server loaded
        messages?.append(Message(testName: "James", withTestMessage: "Hey Guys!"))
        messages?.append(Message(testName:"Paul", withTestMessage:"What's up?"))
        messages?.append(Message(testName:"Amy", withTestMessage:"Hey! :)"))
        messages?.append(Message(testName:"James", withTestMessage:"Want to grab some food later?"))
        messages?.append(Message(testName:"Paul", withTestMessage:"Sure, time and place?"))
        messages?.append(Message(testName:"Amy", withTestMessage:"YAS! I am starving!!!"))
        messages?.append(Message(testName:"James", withTestMessage:"1 hr at the Local Burger sound good?"))
        messages?.append(Message(testName:"Paul", withTestMessage:"Sure thing"))
        messages?.append(Message(testName:"Amy", withTestMessage:"See you there :P"))
        
        chatTable.reloadData()
    }
    
    // MARK: - Private
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        tableView.tableFooterView = UIView(frame: .zero)
        
        chatTable.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        self.chatTable.estimatedRowHeight = 150.0
        self.chatTable.rowHeight = UITableView.automaticDimension
        self.chatTable.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)

    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ChatTableViewCell? = nil
        if cell == nil {
            let nibs = Bundle.main.loadNibNamed("ChatTableViewCell", owner: self, options: nil)
            cell = nibs?[0] as? ChatTableViewCell
        }
        cell?.setCellData(message: messages![indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages!.count
    }
    
}
