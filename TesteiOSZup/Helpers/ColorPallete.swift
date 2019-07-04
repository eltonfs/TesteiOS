//
//  ColorPallete.swift
//  TesteiOSZup
//
//  Created by Elton Santana on 03/07/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit

enum ColorPallete {
    case gray, red, green, orange
    
    var uiColor: UIColor {
        switch self {
        case .gray:
            return UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        case .red:
            return UIColor(red: 218/255, green: 1/255, blue: 1/255, alpha: 1)
        case .green:
            return UIColor(red: 101/255, green: 190/255, blue: 48/255, alpha: 1)
        case .orange:
            return UIColor(red: 255/255, green: 31/255, blue: 31/255, alpha: 1)
        }
    }
}
