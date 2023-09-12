//
//  FeatureCard.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 12.09.2023.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: LandmarkModel
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[2])
//        TextOverlay(landmark: ModelData().features[0])
    }
}

struct TextOverlay: View {
    
    var landmark: LandmarkModel
    var gradient: LinearGradient {
            .linearGradient(
                Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
                startPoint: .bottom,
                endPoint: .center)
        }
    
    var body: some View {
            ZStack(alignment: .bottomLeading) {
                gradient
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                        .bold()
                    Text(landmark.park)
                }
                .padding()
            }
            .foregroundColor(.white)
        }
}