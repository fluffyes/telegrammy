//
//  ConversationViewController.swift
//  telegrammy
//
//  Created by Soulchild on 04/04/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import UIKit
import MessageKit

class Message : MessageType {
    var sender : Sender
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    init(sender: Sender, messageId: String, sentDate: Date, kind: MessageKind) {
        self.sender = sender
        self.messageId = messageId
        self.sentDate = sentDate
        self.kind = kind
    }
}

class ConversationViewController: MessagesViewController {
    var messages: [Message] = []
    var senderDisplayName = "Toriel"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = senderDisplayName
        
        if(senderDisplayName == "Asriel"){
            let message = Message(sender: Sender(id: "asriel", displayName: "Asriel"), messageId: "1", sentDate: Date(), kind: MessageKind.text("Howdy, it's me!"))
            messages.append(message)
        } else if (senderDisplayName == "Sans") {
            let message = Message(sender: Sender(id: "sans", displayName: "Sans"), messageId: "1", sentDate: Date(), kind: MessageKind.text("It's a beautiful day outside"))
            messages.append(message)
        } else {
            let message = Message(sender: Sender(id: "toriel", displayName: "Toriel"), messageId: "1", sentDate: Date(), kind: MessageKind.text("Don't worry, my child"))
            messages.append(message)
        }
            
        // Do any additional setup after loading the view.
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        if let messageFlowLayout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout {
            messageFlowLayout.textMessageSizeCalculator.messageLabelFont = UIFont.systemFont(ofSize: 16.0)
            messageFlowLayout.setMessageIncomingAvatarSize(CGSize(width: 40.0, height: 40.0))
        }
    }
}

extension ConversationViewController : MessagesDataSource {
    func currentSender() -> Sender {
        return Sender(id: "any_unique_id", displayName:senderDisplayName)
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
}

extension ConversationViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let avatar = Avatar(image: UIImage(named: self.senderDisplayName), initials: String(senderDisplayName.prefix(1)))
        avatarView.set(avatar: avatar)
    }
}
