//
//  ColorStore.swift
//  SwiftFinal
//
//

import Foundation

class ColorStore : ObservableObject
{
    @Published var colors : [RGBColor]
    
    init(colors: [RGBColor])
    {
        self.colors = colors
    }
    init()
    {
        self.colors = [RGBColor(red: -1, green: -1, blue: -1)]
    }
}
