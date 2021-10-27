//
//  WelcomeView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/15.
//

import SwiftUI

struct WelcomeView: View {
    
    let coreDM: CoreDataManager
    
    @State private var isPresentedBool = false
    @State private var plants: [Plants] = [Plants]()
    let gradientColor = GradientColor()
    var daysForNotification = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(plants, id:\.self) { item in
                        let amountDays = String(Int(item.reminder))
                        let noImage = UIImage(named: "icons8-no_image")!
                        
                        HStack(spacing: 50) {
                            PlantDetails(flowerName: item.name ?? "no data", reminderDays: amountDays, plantImage: UIImage(data: item.picture ?? Data()) ?? noImage, tagText: "Enter your tags")
                        }
                    }
                }
                VStack {
                    Button("Ajouter une plante") {
                        isPresentedBool.toggle()
                        self.scheduleNotification()
                    }
                    .font(Font.system(size: 30))
                    .frame(width: 300, height: 40, alignment: .center)
                    .padding()
                    .background(
                        gradientColor.linearGradientPink())
                    
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                }
                .navigationBarItems(leading:
                                        HStack {
                    Image("logoAlt")
                        .resizable()
                        .frame(width: 40, height: 65)
                        .navigationBarTitleDisplayMode(.inline)
                    
                    Text(" Plants Paradise")
                        .font(Font.custom("Didot", size: 37))
                        .padding()
                })
                .navigationBarHidden(false)
            }
            .padding()
            
            
        }
        .sheet(isPresented: $isPresentedBool) {
            AddPlants(coreDM: CoreDataManager())
        }
        .onAppear {
            plants = coreDM.getAllPlants()
            print(plants.last?.name as Any)
            self.notificationInitialization()
        }
        
    }
    func notificationInitialization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("successfully initialized")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Local Notification"
        content.subtitle = "Notification received"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView(coreDM: CoreDataManager())
            
        }
    }
}
