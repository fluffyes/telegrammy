//
//  ChatViewController.swift
//  telegrammy
//
//  Created by Soulchild on 04/04/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    
    let chatCellReuseIdentifier = "chatCellReuseIdentifier"
    
    let names = ["Asriel", "Sans", "Toriel"]
    let messages = ["Howdy, it's me!", "It's a beautiful day outside", "Don't worry, my child"]
    
    var selectedRowIndex : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chats"
        // Do any additional setup after loading the view.
        
        chatTableView.register(UINib(nibName: String(describing: ChatTableViewCell.self), bundle: nil), forCellReuseIdentifier: chatCellReuseIdentifier)
        chatTableView.separatorStyle = .singleLine
        chatTableView.separatorColor = UIColor.gray
        chatTableView.tableFooterView = UIView()
        chatTableView.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        chatTableView.dataSource = self
        chatTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "chatToConversationSegue"){
            if let conversationVC = segue.destination as? ConversationViewController,
               let index = selectedRowIndex {
                conversationVC.senderDisplayName =  names[index]
            }
        }
    }
}

extension ChatViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatCellReuseIdentifier, for: indexPath) as! ChatTableViewCell
        
        cell.nameLabel.text = names[indexPath.row]
        cell.messageLabel.text = messages[indexPath.row]
        cell.avatarImageView.image = UIImage(named: names[indexPath.row])
        return cell
    }
}

extension ChatViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedRowIndex = indexPath.row
        self.performSegue(withIdentifier: "chatToConversationSegue", sender: nil)
    }
}
