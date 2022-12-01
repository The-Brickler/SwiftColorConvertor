//
//  RGBView.swift
//  SwiftFinal
//
//  Created by Brunson, Cami on 11/22/22.
//

import SwiftUI

struct RGBView: View
{
    var selectedColor = RGBColor()
    var body: some View
    {
        ZStack
        {
            selectedColor.convertToColor()
            var selectedHSV = selectedColor.convertToHSV()
            VStack
            {
                Text("RGB: (\(selectedColor.red), \(selectedColor.green), \(selectedColor.blue))")
                        .foregroundColor(Color.white)
                Text("HEX: \(selectedColor.convertToHex())")
                    .foregroundColor(Color.white)
                Text("HSV: \(Int(selectedHSV.hue)), \(Int(selectedHSV.sat)), \(Int(selectedHSV.value))")

            }
        }
    }
}

struct RGBView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RGBView()
    }
}
