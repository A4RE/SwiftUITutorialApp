//
//  CategoryRow.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [LandmarkModel]
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(categoryName)
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
                    .foregroundColor(.myCustomColor)


                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(items) { landmark in
                            NavigationLink {
                                LandMarkDetailView(landmark: landmark)
                            } label: {
                                CategoryItem(landmark: landmark)
                            }
                        }
                    }
                }
                .frame(height: 185)
            }
        }
}

struct CategoryRow_Previews: PreviewProvider {
    
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
                    categoryName: landmarks[0].category.rawValue,
                    items: Array(landmarks.prefix(3))
                )
    }
}
