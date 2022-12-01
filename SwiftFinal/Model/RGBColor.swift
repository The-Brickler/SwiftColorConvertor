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
        self.red   =  Int ( arc4random() % UInt32(256) )
        self.green =  Int ( arc4random() % UInt32(256) )
        self.blue  =  Int ( arc4random() % UInt32(256) )
    }
    
    init(red: Int, green: Int, blue: Int)
    {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    public func convertToColor() -> Color
    {
        let redPercent = Double(red) / 255.0
        let greenPercent = Double(green) / 255.0
        let bluePercent = Double(blue) / 255.0
        
        return Color(red: redPercent, green: greenPercent, blue: bluePercent)
    }
    
    public func convertToHSV() -> HSVColor
    {
        var hue : Double //From 0 to 360
        var sat : Double //From 0 100
        var value : Double //From 0 to 1
        
        let redPercent = Double(red) / 255.0
        let greenPercent = Double(green) / 255.0
        let bluePercent = Double(blue) / 255.0
        
        let colorArray = [redPercent, greenPercent, bluePercent]
        
        let max = colorArray.max()!
        let min = colorArray.min()!
        let delta = max - min
        
        //Hue Calculation
        if (delta == 0)
        {
            hue = 0.0
        }
        else
        {
            switch max
            {
            case redPercent:
                hue = (60.0 * ((greenPercent - bluePercent) / delta) + 360.0) % 360
            case greenPercent:
                hue = (60.0 * ((bluePercent - redPercent) / delta ) + 120.0) % 360
            case bluePercent:
                hue = (60.0 * ((redPercent - greenPercent) / delta ) + 240.0) % 360
            default:
                hue = 0.0
            }
        }
        
        //Sat Calculation
        if (max != 0)
        {
            sat = (delta / max) * 100
        }
        else
        {
            sat = 0.0
        }
        
        //Value Calculation
        value = max * 100
        
        let finalColor : HSVColor = HSVColor(hue: hue, sat: sat, value: value)
        return finalColor
    }
    
    public func convertToHex() -> String
    {
        let redCode = decimalToHex(self.red)
        let greenCode = decimalToHex(self.green)
        let blueCode = decimalToHex(self.blue)
        
        let hexCode = "#\(redCode)\(greenCode)\(blueCode)"
        
        return hexCode
    }
    
    private func decimalToHex(_ number: Int) -> String
    {
        var output = String(number, radix: 16)
        return output.uppercased()
//        var quot = number / 16
//        var rem = number % 16
//        var nextChar = ""
//        var output = ""
//
//        while (quot < 0)
//        {
//            switch rem
//            {
//            case 10:
//                nextChar = "A"
//            case 11:
//                nextChar = "B"
//            case 12:
//                nextChar = "C"
//            case 14:
//                nextChar = "D"
//            case 15:
//                nextChar = "E"
//            case 16:
//                nextChar = "F"
//            default:
//                nextChar = String(rem)
//            }
//
//            output += nextChar
//            rem = quot % 16
//            quot /= 16
//        }
//
//        return output
    }
    
    public func randomizeColor() -> Void
    {
        red   =  Int ( arc4random() % UInt32(256) )
        green =  Int ( arc4random() % UInt32(256) )
        blue  =  Int ( arc4random() % UInt32(256) )
    }
}
