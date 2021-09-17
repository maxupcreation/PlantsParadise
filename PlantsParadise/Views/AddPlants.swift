//
//  AddPlantsSwiftUIView.swift
//  PlantsParadise
//
//  Created by Maxime on 07/09/2021.
//

import SwiftUI

struct AddPlants: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: Plants.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Plants.name, ascending: true)],
        predicate: NSPredicate(format: "name == %@", "name")
    ) var items: FetchedResults<Plants>
    
    ///-----------------------
    @State private var plantName: String = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var textCameraButton = "Prendre une photo"
    @State private var textHiddenState = true
    @State private var day = 1
    @State private var opacityButton = 1
    
    private var imageName = "icons8-compact_camera"
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: (selectedImage ?? UIImage(named: imageName)) ?? UIImage())
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
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
                Spacer()
                ///-----------------------
                TextField("Nom de la plante",text: $plantName)
                    
                    ///-----------------------
                    .padding()
                    .border(Color.gray, width: 1)
                    .cornerRadius(3.0)
                HStack {
                    Text("Rappel arrosage")
                        .font(Font.system(size: 20))
                        .padding()
                        .padding()
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
                Button("Ajouter la plante") {
                    action: do {
                        let data = Plants(context: managedObjectContext)
                        data.name = plantName
                        data.picture = selectedImage?.pngData()
                        data.reminder = Double(day)
                        PersistenceController.shared.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                        print(data)
                    }
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(Constant.Color.magentaUIColor), Color(Constant.Color.blueUIColor)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(8)
                .foregroundColor(.white)
            }
            .padding()
        }
    }
    
    
    
    struct AddPlantsSwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            AddPlants()
        }
    }
}
