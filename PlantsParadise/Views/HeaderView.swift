//
//  HeaderView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/7.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .font(.largeTitle)
                    .navigationBarTitleDisplayMode(.automatic)
               
                Text("  Plants Paradise")
                    .font(Font.custom("Didot", size: 30))
            }
            Spacer()
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
