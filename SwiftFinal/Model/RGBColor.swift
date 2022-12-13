//
//  RGBColor.swift
//  SwiftFinal
//
//

import Foundation

import SwiftUI

class RGBColor : ObservableObject, Identifiable
{
    @Published var red : Int
    @Published var green : Int
    @Published var blue : Int
    let id : UUID = UUID()
    
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
    
    public func invert() -> RGBColor
    {
        var invertedColor : RGBColor
        
        let invertedRed = 255 - red
        let invertedGreen = 255 - green
        let invertedBlue = 255 - blue
        
        invertedColor = RGBColor(red: invertedRed, green: invertedGreen, blue: invertedBlue)
        
        return invertedColor
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
            case Double(redPercent):
                hue = (60.0 * ((greenPercent - bluePercent) / delta) + 360.0).truncatingRemainder(dividingBy: 360)
            case Double(greenPercent):
                hue = (60.0 * ((bluePercent - redPercent) / delta ) + 120.0).truncatingRemainder(dividingBy: 360)
            case Double(bluePercent):
                hue = (60.0 * ((redPercent - greenPercent) / delta ) + 240.0).truncatingRemainder(dividingBy: 360)
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
        
        var hexCode = "#\(redCode)\(greenCode)\(blueCode)"
        if (!self.isValid())
        {
            hexCode = "INVALID"
        }
        
        return hexCode
    }
    
    private func decimalToHex(_ number: Int) -> String
    {
        var output = String(number, radix: 16)
        if (output.count < 2)
        {
            output = "0\(output)"
        }
        
        return output.uppercased()
    }
    
    public func randomizeColor() -> Void
    {
        red   =  Int ( arc4random() % UInt32(256) )
        green =  Int ( arc4random() % UInt32(256) )
        blue  =  Int ( arc4random() % UInt32(256) )
    }
    
    public func isValid() -> Bool
    {
        var valid = true
        if (red < 0 || red > 255)
        {
            valid = false
        }
        if (green < 0 || green > 255)
        {
            valid = false
        }
        if (blue < 0 || blue > 255)
        {
            valid = false
        }
        
        return valid
    }
}
