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
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var clientLbl: UILabel!
    @IBOutlet weak var informationLbl: UILabel!
    @IBOutlet weak var ownerNameLbl: UILabel!
    @IBOutlet weak var buildingNameLbl: UILabel!
    @IBOutlet weak var locationAdressLbl: UILabel!
    @IBOutlet weak var meetingDayLbl: UILabel!
    @IBOutlet weak var meetingTime: UILabel!
    
    var image = UIImage(systemName: "person")
    var isAccepted = "o`z qabuliga yozib qoydi"
    var isNotAccepted = "o`z qabuliga yozib qoymadi"
    @IBOutlet weak var phoeOwnerLbl: UILabel!
    
   
    
    override func viewDidLoad() {
  
    }
    
    
    
    func didReceive(_ notification: UNNotification) {
       
        let content = notification.request.content

        // 2
      
        let userInfo = notification.request.content.userInfo
        clientLbl.text = userInfo["name"] as! String
        ownerNameLbl.text = userInfo["ownerName"] as! String
        phoeOwnerLbl.text = userInfo["phone"] as! String
        buildingNameLbl.text = userInfo["buildingName"] as! String
        locationAdressLbl.text = userInfo["locationAddress"] as! String
        meetingDayLbl.text = userInfo["meetingDay"] as! String
        meetingTime.text = userInfo["meetingTime"] as! String
       
        
        if userInfo["accepted"] as! Bool == true {
            informationLbl.text = "Sizni \(ownerNameLbl.text!) " + isAccepted
        } else {
            informationLbl.text = "Sizni \(ownerNameLbl.text!) " + isNotAccepted
        }


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
    @IBAction func shareBtnTapped(_ sender: Any) {
        let alertController = UIAlertController (title: "Title", message: "Go to Settings?", preferredStyle: .alert)

            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in

                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }

//                if UIApplication.shared.canOpenURL(settingsUrl) {
//                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                        print("Settings opened: \(success)") // Prints true
//                    })
//                }
            }
            alertController.addAction(settingsAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alertController.addAction(cancelAction)

            present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
       
print("star tapped")
      
    }


}

extension UIImageView {
  
}
