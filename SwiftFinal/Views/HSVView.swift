//
//  RGBView.swift
//  SwiftFinal
//
//

import SwiftUI

struct HSVView: View
{
    @ObservedObject var selectedColor = RGBColor()
    @EnvironmentObject var savedColors : ColorStore
    
    @State var newHue : Double = 0.0
    @State var newSat : Double = 0.0
    @State var newValue : Double = 0.0
    
    var textWidth : Double = 100.0
    
    var body: some View
    {
        ZStack
        {
            let newColor = HSVColor(hue: newHue, sat: newSat, value: newValue).convertToRGB()
            
            let backgroundColor = selectedColor.convertToColor()
            let selectedHSV = selectedColor.convertToHSV()
            let invertedRGB = selectedColor.invert().convertToColor()
            
            let formattedRGB = "\(selectedColor.red), \(selectedColor.green), \(selectedColor.blue)"
            let formattedHEX = "\(selectedColor.convertToHex())"
            let formattedHSV = "\(Int(selectedHSV.hue)), \(Int(selectedHSV.sat)), \(Int(selectedHSV.value))"
            
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
                Button("Randomize", action: randomize)
                    .foregroundColor(invertedRGB)
                    .padding(5)
                    .accessibilityLabel("A button to randomize the color")
                    .accessibilityValue("Randomize")
                
                
                HStack
                {
                    Text("Hue: \(Int(newHue))")
                        .multilineTextAlignment(.leading)
                        .frame(width: textWidth)
                        .foregroundColor(Color.white)
                        .shadow(color: invertedRGB, radius: 3.0)
                    Slider(value: $newHue, in: 0.0 ... 359.0)
                        .padding(.trailing)
                        .accentColor(HSVColor(hue: newHue, sat: 1, value: 1).convertToRGB().convertToColor())
                }
                
                HStack
                {
                    Text("Sat: \(Int(newSat * 100))")
                        .multilineTextAlignment(.leading)
                        .frame(width: textWidth)
                        .foregroundColor(Color.white)
                        .shadow(color: invertedRGB, radius: 3.0)
                    Slider(value: $newSat, in: 0.0 ... 1)
                        .padding(.trailing)
                        .accentColor(HSVColor(hue: newHue, sat: newSat, value: 1).convertToRGB().convertToColor())
                }
                HStack
                {
                    Text("Value: \(Int(newValue * 100))")
                        .multilineTextAlignment(.leading)
                        .frame(width: textWidth)
                        .foregroundColor(Color.white)
                        .shadow(color: invertedRGB, radius: 3.0)
                    Slider(value: $newValue, in: 0.0 ... 1)
                        .padding(.trailing)
                        .accentColor(HSVColor(hue: 0, sat: 0, value: newValue).convertToRGB().convertToColor())
                }
                Spacer(minLength: CGFloat(400.0))
                Button("Save to History", action: saveColor)
                    .foregroundColor(invertedRGB)
                ZStack{
                    newColor.convertToColor()
                    Button("Apply", action: setColor)
                        .foregroundColor(newColor.invert().convertToColor())
                }
                
            }
        }
    }
    
    func randomize() -> Void
    {
        selectedColor.randomizeColor()
    }
    
    func setColor() -> Void
    {
        let hsv = HSVColor(hue: newHue, sat: newSat, value: newValue).convertToRGB()
        selectedColor.red = hsv.red
        selectedColor.green = hsv.green
        selectedColor.blue = hsv.blue
    }
    
    func saveColor() -> Void
    {
        if (!savedColors.colors[0].isValid())
        {
            savedColors.colors.removeFirst()
        }
        savedColors.colors.append(selectedColor)
    }
}



struct HSVView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HSVView()
    }
}
