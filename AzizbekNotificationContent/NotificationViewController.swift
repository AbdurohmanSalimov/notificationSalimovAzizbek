//
//  NotificationViewController.swift
//  AzizbekNotificationContent
//
//  Created by Azizbek Salimov on 01.06.2022.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!


   
    
    override func viewDidLoad() {
    
    }
    
    func didReceive(_ notification: UNNotification) {
//        self.label?.text = notification.request.content.body
//
       

        // 2
        let content = notification.request.content
//        podcastTitleLabel.text = content.subtitle
//        podcastBodyLabel.text = content.body

        // 3
        guard
          let attachment = content.attachments.first,
          attachment.url.startAccessingSecurityScopedResource()
          else {
            return
        }

        // 4
        let fileURLString = attachment.url

        guard
          let imageData = try? Data(contentsOf: fileURLString),
          let image = UIImage(data: imageData)
          else {
            attachment.url.stopAccessingSecurityScopedResource()
            return
        }

        // 5
        imageView.image = image
        attachment.url.stopAccessingSecurityScopedResource()

    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
print("star tapped")
      
    }


}
