import Foundation
import SwiftUI

class LocalNotificationManager: ObservableObject {
    

    let coreDM: CoreDataManager
    
    var notifications = [Notification]()
    
    init(coreDM:CoreDataManager) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if granted == true && error == nil {
                    print("Notifications permitted")
                } else {
                    print("Notifications not permitted")
                }
            }
        self.coreDM = coreDM
        }
    
    func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
        let content = UNMutableNotificationContent()
              content.title = title
              if let subtitle = subtitle {
                  content.subtitle = subtitle
              }
              content.body = body
                 
              let imageName = "logo"
              guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
              let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
              content.attachments = [attachment]
        
//        var dateComponents = DateComponents()
//           dateComponents.day = 1
//        UNCalendarNotificationTrigger(dateMatching: dateComponents , repeats: true)

        let trigger =  UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
        
                let request = UNNotificationRequest(identifier: "demoNotification", content: content, trigger: trigger)
       
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }

}
