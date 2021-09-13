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
    @State var textCameraButton = "Prendre une photo"
    @State var textHiddenState = true
    @State private var day = 1
    @State private var opacityButton = 1
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Button(textCameraButton) {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                    
                }
                .foregroundColor(.black)
                .background(Image(uiImage: selectedImage ?? UIImage())
                                .resizable()
                                .frame(width: 200, height: 280, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                            
                                .cornerRadius(50))
                .font(Font.system(size: 20))
                .opacity(Double(opacityButton))
                
                Spacer()
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
