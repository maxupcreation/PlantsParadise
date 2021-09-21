//
//  AddPlantsSwiftUIView.swift
//  PlantsParadise
//
//  Created by Maxime on 07/09/2021.
//

import SwiftUI

struct AddPlants: View {
    
    //For dissmiss View
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //For save in coreData
    let coreDM: CoreDataManager
    let gradientColor = GradientColor()
    ///-----------------------
    @State private var plantName: String = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var textCameraButton = "Prendre une photo"
    @State private var textHiddenState = true
    @State private var day = 1
    @State private var opacityButton = 1
    
    let imageName = "icons8-beach"
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: (selectedImage ?? UIImage(named: imageName)) ?? UIImage())
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(50)
                    .opacity(Double(opacityButton))
                    .sheet(isPresented: self.$isImagePickerDisplay) {
                        ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                    }
                
                Button(textCameraButton) {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }
                .frame(width: 325, height: 65, alignment: .center)
                .font(Font.system(size: 35))
                .foregroundColor(.white)
                .background(gradientColor.linearGradientBlue())
                .clipShape(Capsule(style: .circular))
                
                ///-----------------------
                TextField("Nom de la plante", text: $plantName)
                        .padding(20)
                        .background(Color(Constant.Color.ligthGray))
                        .cornerRadius(100)
                        .padding(20)
                    ///----------------------
                Text("Rappel arrosage")
                    .font(Font.system(size: 35))
                    .padding(10)
                
                HStack {
                    Button("-") {
                        guard day > 1 else { return }
                        day -= 1
                    }
                    .font(Font.system(size: 50))
                    .frame(width: 30, height: 70)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(gradientColor.linearGradientPink())
                    .clipShape(Capsule(style: .circular))
                    .padding()
                    
                    ///------------------------
                    VStack {
                        Text("\(day)")
                            .font(Font.system(size: 50))
                        Text("Jours")
                            .font(Font.system(size: 30))
                    }
                    .padding()
                    Button("+") {
                        day += 1
                    }
                    
                    .font(Font.system(size: 50))
                    .frame(width: 30, height: 70)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(gradientColor.linearGradientPink())
                    .clipShape(Capsule(style: .circular))
                    .padding()
                }
                Spacer()
                Button("Ajouter cette plante") {
                    action: do {
                        coreDM.savePlants(name: plantName, img: selectedImage ?? UIImage(), remember: Double(day))
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                .font(Font.system(size: 30))
                .frame(width: 300, height: 40, alignment: .center)
                .padding()
                .background(gradientColor.linearGradientPink())
                .foregroundColor(.white)
                .clipShape(Capsule(style: .circular))
                Spacer(minLength: 130)
            }
                         
        }
    }
    
    
    
    struct AddPlantsSwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddPlants( coreDM: CoreDataManager())
        }
    }
}
