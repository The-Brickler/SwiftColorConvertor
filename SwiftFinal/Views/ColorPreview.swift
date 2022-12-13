//
//  ColorPreview.swift
//  SwiftFinal
//
//

import SwiftUI

struct ColorPreview: View
{
    let selectedColor : RGBColor
    var body: some View
    {
        let backgroundColor = selectedColor.convertToColor()
        let selectedHSV = selectedColor.convertToHSV()
        let invertedRGB = selectedColor.invert().convertToColor()
        
        let formattedRGB = "\(selectedColor.red), \(selectedColor.green), \(selectedColor.blue)"
        let formattedHEX = "\(selectedColor.convertToHex())"
        let formattedHSV = "\(Int(selectedHSV.hue)), \(Int(selectedHSV.sat)), \(Int(selectedHSV.value))"
        
        ZStack
        {
            backgroundColor
            
            VStack
            {
                Text("RGB:\t\t\(formattedRGB)")
                    .foregroundColor(Color.white)
                    .shadow(color: invertedRGB, radius: 3.0)
                    .accessibilityLabel("The RGB color code")
                    .accessibilityValue(formattedRGB)
                Text("HEX:\t\t\(formattedHEX)")
                    .foregroundColor(Color.white)
                    .shadow(color: invertedRGB, radius: 3.0)
                    .accessibilityLabel("The HEX color code")
                    .accessibilityValue(formattedHEX)
                Text("HSV:\t\t\(formattedHSV)")
                    .foregroundColor(Color.white)
                    .shadow(color: invertedRGB, radius: 3.0)
                    .accessibilityLabel("The HSV color code")
                    .accessibilityValue(formattedHSV)
            }
        }
        
        
    }
}

struct ColorPreview_Previews: PreviewProvider {
    static var previews: some View {
        ColorPreview(selectedColor: RGBColor())
    }
}
