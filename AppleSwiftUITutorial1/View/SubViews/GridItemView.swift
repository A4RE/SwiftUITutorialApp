//
//  GridItemView.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

struct GridItemView: View {
    
    var landmark: LandmarkModel
    
    var body: some View {
        ZStack {
            landmark.image
                .resizable()
                .frame(width: 170, height: 120)
                .overlay(alignment: .bottomLeading) {
                    Text(landmark.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                        .padding(.leading, 2)
                }
                .overlay(alignment: .topTrailing, content: {
                    if landmark.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .padding(.top, 2)
                            .padding(.trailing, 2)
                    }
                })
                .cornerRadius(10)
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static let landmarks = ModelData().landmarks
    static var previews: some View {
        GridItemView(landmark: landmarks[0])
    }
}
