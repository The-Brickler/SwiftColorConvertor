//
//  HSVColor.swift
//  SwiftFinal
//
//  Created by Brunson, Cami on 11/22/22.
//

import Foundation

class HSVColor
{
    var hue : Double
    var sat : Double
    var value : Double
    
    init()
    {
        self.hue = 0.0
        self.sat = 0.0
        self.value = 0.0
    }
    
    init(hue: Double, sat: Double, value: Double)
    {
        self.hue = hue
        self.sat = sat
        self.value = value
    }
    
    func convertToRGB() -> RGBColor
    {
        var converted : RGBColor
        var red = 0.0
        var green = 0.0
        var blue = 0.0
        
        let chroma = value * sat
        let huePrime = hue / 60.0
        let averageColor = chroma * (1 - abs(huePrime.truncatingRemainder(dividingBy: 2) - 1))
        let baseline = value - chroma
        
        switch huePrime
        {
        case 0 ..< 1:
            red = chroma
            green = averageColor
            blue = 0.0
        case 1 ..< 2:
            red = averageColor
            green = chroma
            blue = 0.0
        case 2 ..< 3:
            red = 0.0
            green = chroma
            blue = averageColor
        case 3 ..< 4:
            red = 0.0
            green = averageColor
            blue = chroma
        case 4 ..< 5:
            red = averageColor
            green = 0.0
            blue = chroma
        case 5 ..< 6:
            red = chroma
            green = 0.0
            blue = averageColor
        default:
            red = 0.0
            green = 0.0
            blue = 0.0
        }
        
        red += baseline
        green += baseline
        blue += baseline
        
        red *= 256
        green *= 256
        blue *= 256
        
        converted = RGBColor(red: Int(red), green: Int(green), blue: Int(blue))
        
        return converted
    }
}
