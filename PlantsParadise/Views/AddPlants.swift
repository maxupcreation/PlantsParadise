//
//  AddPlantsSwiftUIView.swift
//  PlantsParadise
//
//  Created by Maxime on 07/09/2021.
//

import SwiftUI

struct AddPlants: View {
    let blueUIColor = UIColor(named: "BlueParadise")!
    let magentaUIColor = UIColor(named: "MagentaParadise")!
    ///-----------------------
    @State private var plantName:String = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    
    @State private var day = 1
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Button("Prendre une photo") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                    
                }
                .frame(width: 100, height: 200, alignment: .top)
                .background(Image(uiImage: selectedImage ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(8))
                .font(Font.system(size: 20))
             Spacer()
                ///-----------------------
                TextField("Nom de la plante",text: $plantName, onCommit:  {
                })
                ///-----------------------
                    .padding()
                HStack {
                    Text("Rappel arrosage")
                        .padding(.leading, 15.0)
                        .font(Font.system(size: 20))
                    ///-----------------------
                    Stepper("", onIncrement: {
                        day += 1
                    }, onDecrement: {
                        day -= 1
                    })
                        .padding()
                }
                ///------------------------
                Text("Tout les \(day) jours")
                    .font(Font.system(size: 30))
                ///------------------------
                Button("Ajouter une plante") {
                    
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(magentaUIColor), Color(blueUIColor)]), startPoint: .top, endPoint: .bottom)
                )
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
    }
    
}

struct AddPlantsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlants()
    }
}
