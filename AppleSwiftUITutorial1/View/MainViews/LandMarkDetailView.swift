//
//  LandMarkDetailView.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

struct LandMarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: LandmarkModel
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
                .disabled(true)
            CircleImage(image: landmark.image)
                .offset(y: -150)
                .padding(.bottom, -150)
            VStack(alignment: .leading) {
                HStack {
                    Text("\(landmark.name), \(landmark.state)")
                        .font(.title)
                    .fontWeight(.semibold)
                    FavButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                Text("Category: \(landmark.category.rawValue)")
                    .foregroundColor(.mySecondaryColor)
                Text(landmark.park)
                    .font(.subheadline)
                    .foregroundColor(.mySecondaryColor)
                Divider()
                Text(landmark.description)
                    .multilineTextAlignment(.leading)
            }
            .foregroundColor(.myCustomColor)
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandMarkDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandMarkDetailView(landmark: modelData.landmarks[3])
            .environmentObject(modelData)
    }
}
