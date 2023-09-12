//
//  GridView.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

struct GridView: View {
    @State private var selectedFramework: LandmarkModel? {
        didSet {
            showDetailView = true
        }
    }
    @State private var showDetailView: Bool = false
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelData
    @State private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var filteredLandmarks: [LandmarkModel] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredLandmarks) { landmark in
                        VStack(alignment: .leading) {
                            GridItemView(landmark: landmark)
                                .onTapGesture {
                                    selectedFramework = landmark
                                }
                        }
                    }
                }
            }
            .sheet(isPresented: $showDetailView, content: {
                SheetDetailView(landmark: selectedFramework ?? ModelData().landmarks[0])
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: showFavoritesOnly ? "star.fill" : "star")
                        .foregroundColor(.BlackWhite)
                        .onTapGesture {
                            showFavoritesOnly.toggle()
                        }
                }
            }
            .navigationTitle("Grid of Landmarks")
            .navigationBarTitleDisplayMode(.automatic)
            .padding()
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(ModelData())
    }
}
