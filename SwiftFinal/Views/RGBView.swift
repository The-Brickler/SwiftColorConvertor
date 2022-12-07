//
//  RGBView.swift
//  SwiftFinal
//
//

import SwiftUI

struct RGBView: View
{
    @ObservedObject var selectedColor = RGBColor()
    
    @State var newRed : String = ""
    @State var newGreen : String = ""
    @State var newBlue : String = ""
    
    var body: some View
    {
        ZStack
        {
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
                
                HStack {
                    InputField(title: "Red", hint: "0 - 255", result : $newRed)
                    InputField(title: "Green", hint: "0 - 255", result : $newGreen)
                    InputField(title: "Blue", hint: "0-255", result : $newBlue)
                }
                
            }
        }
    }
    
    func randomize() -> Void
    {
        selectedColor.randomizeColor()
    }
}



struct RGBView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RGBView()
    }
}
