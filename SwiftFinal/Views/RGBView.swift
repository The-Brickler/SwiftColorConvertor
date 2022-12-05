//
//  RGBView.swift
//  SwiftFinal
//
//

import SwiftUI

struct RGBView: View
{
    @ObservedObject var selectedColor = RGBColor()
    var body: some View
    {
        ZStack
        {
            selectedColor.convertToColor()
            let selectedHSV = selectedColor.convertToHSV()
            let invertedRGB = selectedColor.invert().convertToColor()
            VStack
            {
                Text("RGB:\t\(selectedColor.red), \(selectedColor.green), \(selectedColor.blue)")
                        .foregroundColor(invertedRGB)
                Text("HEX:\t\(selectedColor.convertToHex())")
                    .foregroundColor(invertedRGB)
                Text("HSV:\t\(Int(selectedHSV.hue)), \(Int(selectedHSV.sat)), \(Int(selectedHSV.value))")
                    .foregroundColor(invertedRGB)
                Button("Randomize", action: randomize)

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
