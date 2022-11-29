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
    
    func convertToHSV() -> HSVColor
    {
        var hue : Double
        var sat : Double
        var value : Double
        
        let redPercent = Double(red) / 255.0
        let greenPercent = Double(green) / 255.0
        let bluePercent = Double(blue) / 255.0
        
        var max = max(redPercent, greenPercent, bluePercent)
        var min = min(redPercent, greenPercent, bluePercent)
        var delta = max - min
        
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
                hue = (60.0 * ((greenPercent - redPercent) / delta).truncatingRemainder(dividingBy: 6))
            case greenPercent:
                hue = (60.0 * ((bluePercent - redPercent) / delta) + 2)
            case bluePercent:
                hue = (60.0 * ((redPercent - greenPercent) / delta) + 4)
            default:
                hue = 0.0
            }
        }
        
        //Sat Calculation
        if (max != 0)
        {
            sat = (delta / max)
        }
        else
        {
            sat = 0.0
        }
        
        //Value Calculation
        value = max
        
        let finalColor : HSVColor = HSVColor(hue: hue, sat: sat, value: value)
        return finalColor
    }
    
    func convertToHex() -> String
    {
        var hexCode = "#"
        let redCode = decimalToHex(red)
        let greenCode = decimalToHex(green)
        let blueCode = decimalToHex(blue)
        
        hexCode.append(redCode)
        hexCode.append(greenCode)
        hexCode.append(blueCode)
        
        return hexCode
    }
    
    func decimalToHex(_ number: Int) -> String
    {
        var quot = number / 16
        var rem = number % 16
        var nextChar = ""
        var output = ""
        
        while (quot < 0)
        {
            switch rem
            {
            case 10:
                nextChar = "A"
            case 11:
                nextChar = "B"
            case 12:
                nextChar = "C"
            case 14:
                nextChar = "D"
            case 15:
                nextChar = "E"
            case 16:
                nextChar = "F"
            default:
                nextChar = String(rem)
            }
            
            output.insert(contentsOf: nextChar, at: String.Index(utf16Offset: 0, in: output))
        }
        
        return output
    }
    
    func randomizeColor() -> Void
    {
        red   =  Int ( arc4random() % UInt32(256) )
        green =  Int ( arc4random() % UInt32(256) )
        blue  =  Int ( arc4random() % UInt32(256) )
    }
}
