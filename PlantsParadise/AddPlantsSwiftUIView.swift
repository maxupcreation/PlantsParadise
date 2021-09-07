//
//  AddPlantsSwiftUIView.swift
//  PlantsParadise
//
//  Created by Maxime on 07/09/2021.
//

import SwiftUI

struct AddPlantsSwiftUIView: View {
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
                       }.padding()
        TextField("Nom de la plante",text: $plantName, onCommit:  {
        }).padding()
            VStack(alignment: .center) {
                Text("Rappel arrosage")
          
                .padding(.leading, 15.0)
                .font(Font.system(size: 20))
            }.padding()
            ///-----------------------
            Stepper("", onIncrement: {
                day += 1
                       }, onDecrement: {
                           day -= 1
                       })
                
                
            ///------------------------
                       Text("Tout les \(day) jours")
                .font(Font.system(size: 30))
    
        }
        
    }
}

struct AddPlantsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlantsSwiftUIView()
    }
}
