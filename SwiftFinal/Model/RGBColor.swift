//
//  RGBColor.swift
//  SwiftFinal
//
//  Created by Brunson, Cami on 11/22/22.
//

import Foundation

import SwiftUI

class RGBColor
{
    var red : Int
    var green : Int
    var blue : Int
    
    init()
    {
        self.red = 0
        self.green = 0
        self.blue = 0
    }
    
    init(red: Int, green: Int, blue: Int)
    {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    func convertToColor() -> Color
    {
        let redPercent = Double(red) / 255.0
        let greenPercent = Double(green) / 255.0
        let bluePercent = Double(blue) / 255.0
        
        return Color(red: redPercent, green: greenPercent, blue: bluePercent)
    }
}
