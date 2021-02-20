//
//  Fonts.swift
//  App02-MyData
//
//  Created by Enrique Diaz de Leon Hicks on 2/16/21.
//

import Foundation
import SwiftUI

extension Font {
    public static func RobotoRegular(size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
    public static func RobotoMono(size: CGFloat) -> Font {
        return Font.custom("RobotoMono-Regular", size:size)
    }
}
