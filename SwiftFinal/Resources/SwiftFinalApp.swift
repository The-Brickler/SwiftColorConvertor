//
//  SwiftFinalApp.swift
//  SwiftFinal
//
//

import SwiftUI

@main
struct SwiftFinalApp: App
{
    
    @StateObject private var savedColors : ColorStore = ColorStore(colors: [RGBColor(red: -1, green: -1, blue: -1)])
    var body: some Scene
    {
        WindowGroup
        {
            CreateView()
                .environmentObject(savedColors)
        }
    }
}
