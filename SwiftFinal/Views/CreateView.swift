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
                Text("Select input type")
                HStack
                {
                    NavigationLink("RGB", destination: RGBView())
                }
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
