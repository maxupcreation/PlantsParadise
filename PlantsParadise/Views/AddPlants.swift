//
//  AddPlantsSwiftUIView.swift
//  PlantsParadise
//
//  Created by Maxime on 07/09/2021.
//

import SwiftUI

struct AddPlants: View {
    @State private var plantName:String = ""
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    
    @State private var day = 1
    
    
    var body: some View {
     
        VStack {
                Button("Prendre une photo") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }
                .padding()
                .font(Font.system(size: 20))
                ///-----------------------
                TextField("Nom de la plante",text: $plantName, onCommit:  {

                })
                ///-----------------------
                .padding()
            HStack {
                    Text("Rappel arrosage")
                        .font(Font.system(size: 20))
                        .padding()
                        .padding()

                ///-----------------------
//                Stepper("", onIncrement: {
//                    day += 1
//                }, onDecrement: {
//                    day -= 1
//                })
//                    .padding()
            }
            
            HStack {
                Button("-") {
                    guard day > 1 else { return }
                    day -= 1
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.4))
                .clipShape(Circle())
      
                ///------------------------
                    Text("Tout les \(day) jours")
                    .font(Font.system(size: 30))
                
                Button("+") {
                    day += 1
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.4))
                .clipShape(Circle())
            }
            
        }
        .padding()
        
        
    }
}

struct AddPlantsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlants()
    }
}
