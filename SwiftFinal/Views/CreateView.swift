//
//  CreateView.swift
//  SwiftFinal
//
//  Created by Brunson, Cami on 10/7/22.
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
                NavigationLink("Go to screen 2", destination: SecondView())
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
