//
//  InputField.swift
//  SwiftFinal
//
//

import SwiftUI

struct InputField: View
{
    let title : String
    let hint : String
    
    @Binding var result : String
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .accessibilityLabel("Title Label")
                .accessibilityValue(title)
            TextField(hint, text: $result)
                .accessibilityLabel("Field for: \(hint)")
                .accessibilityValue(result)
                .disableAutocorrection(true)
        }
        .padding()
    }
}

struct InputField_Previews: PreviewProvider
{
    static var previews: some View
    {
        InputField(title: "Preview", hint: "Preview", result : .constant("Stored in @Binding"))
    }
}
