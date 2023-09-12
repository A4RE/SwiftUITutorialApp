//
//  FavButton.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

struct FavButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? .myCustomColor : .myCustomColor)
        }

    }
}

struct FavButton_Previews: PreviewProvider {
    static var previews: some View {
        FavButton(isSet: .constant(false))
    }
}
