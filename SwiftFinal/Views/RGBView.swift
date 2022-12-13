//
//  RGBView.swift
//  SwiftFinal
//
//

import SwiftUI

struct RGBView: View
{
    @ObservedObject var selectedColor = RGBColor()
    @EnvironmentObject var savedColors : ColorStore
    
    @State var newRed : Double = 0.0
    @State var newGreen : Double = 0.0
    @State var newBlue : Double = 0.0
    
    var textWidth : Double = 100.0
    
    var body: some View
    {
        ZStack
        {
            let newColor = RGBColor(red: Int(newRed), green: Int(newGreen), blue: Int(newBlue))
            
            let backgroundColor = selectedColor.convertToColor()
            let selectedHSV = selectedColor.convertToHSV()
            let invertedRGB = selectedColor.invert().convertToColor()
            
            let formattedRGB = "\(selectedColor.red), \(selectedColor.green), \(selectedColor.blue)"
            let formattedHEX = "\(selectedColor.convertToHex())"
            let formattedHSV = "\(Int(selectedHSV.hue)), \(Int(selectedHSV.sat)), \(Int(selectedHSV.value))"
            
            backgroundColor
                .edgesIgnoringSafeArea(.top)
            
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
                    Text("Red: \(Int(newRed))")
                        .multilineTextAlignment(.leading)
                        .frame(width: textWidth)
                        .foregroundColor(Color.white)
                        .shadow(color: invertedRGB, radius: 3.0)
                    Slider(value: $newRed, in: 0.0 ... 255.0)
                        .padding(.trailing)
                        .accentColor(Color(red: newRed / 255.0, green: 0.0, blue: 0.0))
                }
                
                HStack
                {
                    Text("Green: \(Int(newGreen))")
                        .multilineTextAlignment(.leading)
                        .frame(width: textWidth)
                        .foregroundColor(Color.white)
                        .shadow(color: invertedRGB, radius: 3.0)
                    Slider(value: $newGreen, in: 0.0 ... 255.0)
                        .padding(.trailing)
                        .accentColor(Color(red: 0.0, green: newGreen / 255.0, blue: 0.0))
                }
                HStack
                {
                    Text("Blue: \(Int(newBlue))")
                        .multilineTextAlignment(.leading)
                        .frame(width: textWidth)
                        .foregroundColor(Color.white)
                        .shadow(color: invertedRGB, radius: 3.0)
                    Slider(value: $newBlue, in: 0.0 ... 255.0)
                        .padding(.trailing)
                        .accentColor(Color(red: 0.0, green: 0.0, blue: newBlue / 255.0))
                }
                Spacer(minLength: CGFloat(450.0))
                Button("SAVE", action: saveColor)
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
        selectedColor.red = Int(newRed)
        selectedColor.green = Int(newGreen)
        selectedColor.blue = Int(newBlue)
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

struct RGBView_Previews: PreviewProvider
{
    
    static var previews: some View
    {
        RGBView()
    }
}
