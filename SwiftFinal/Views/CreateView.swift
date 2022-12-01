//
//  CreateView.swift
//  SwiftFinal
//
//

import SwiftUI

struct CreateView: View
{
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("Screen 1")
                NavigationLink("Go to screen 2", destination: RGBView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CreateView()
    }
}
