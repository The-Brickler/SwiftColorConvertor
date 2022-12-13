//
//  SavesView.swift
//  SwiftFinal
//
//

import SwiftUI

struct SavesView: View
{
    @EnvironmentObject var savedColors : ColorStore
    
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
                            
                            ZStack
                            {
                                color.convertToColor()
                                    .edgesIgnoringSafeArea(.all)
                                NavigationLink(color.convertToHex(), destination: ColorPreview(selectedColor: color))
                                    .foregroundColor(Color.white)
                                .shadow(color: color.invert().convertToColor(), radius: 3)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func removeFallback() -> Void
    {
        savedColors.colors.removeFirst()
    }
}

struct SavesView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SavesView()
    }
}
