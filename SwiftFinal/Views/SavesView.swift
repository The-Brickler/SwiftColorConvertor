//
//  SavesView.swift
//  SwiftFinal
//
//

import SwiftUI

struct SavesView: View
{
    let savedColors : ColorStore
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                Section
                {
                    if (!savedColors.colors[0].isValid())
                    {
                        Text("You have no colors saved :( \nGo save some and then come back :)")
                    }
                    else
                    {
                        ForEach(savedColors.colors)
                        {
                            color in
                            
                            NavigationLink(color.convertToHex(), destination: ColorPreview(selectedColor: color))
                                .foregroundColor(color.convertToColor())
                                .shadow(color: color.invert().convertToColor(), radius: 3)
                        }
                    }
                }
            }
        }
    }
}

struct SavesView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SavesView(savedColors: ColorStore(colors: [RGBColor(red: 0, green: 0, blue: 255)]))
    }
}
