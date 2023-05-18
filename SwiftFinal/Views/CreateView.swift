//
//  CreateView.swift
//  SwiftFinal
//
//

import SwiftUI

struct CreateView: View
{
    @EnvironmentObject var savedColors : ColorStore
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("Select input type")
                HStack
                {
                    NavigationLink("RGB", destination: RGBView())
                    NavigationLink("HSV", destination: HSVView())
                }
                NavigationLink("Color History", destination: SavesView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CreateView()
            .environmentObject(ColorStore(colors: [RGBColor(red: -1, green: -1, blue: -1)]))
    }
}
