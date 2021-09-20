//
//  Constant.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/14.
//

import Foundation
import SwiftUI

struct Constant {
    // TODO: - Here can put some string access by Constant.(What you save)
    
    struct Config {
        // TODO: - Here we can do so key privacy
        
    }
    
    struct Color {
        static let blueUIColor = UIColor(named: "BlueParadise")  ?? UIColor.black
        static let magentaUIColor = UIColor(named: "MagentaParadise") ?? UIColor.black
        static let ligthGray = UIColor(named: "ligthGray") ?? UIColor.black
        static let ligthPink = UIColor(named: "ligthPink") ?? UIColor.black
        static let altBlue = UIColor(named: "altBlue") ?? UIColor.black
        
    }
}

struct GradientColor {
    
    func linearGradientPink() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(Constant.Color.magentaUIColor), Color(Constant.Color.ligthPink)]), startPoint: .top, endPoint: .bottom)
    }
    
    func linearGradientBlue() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(Constant.Color.blueUIColor), Color(Constant.Color.altBlue)]), startPoint: .top, endPoint: .bottom)
    }
    
   
}
