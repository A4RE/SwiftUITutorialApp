//
//  ProfileHost.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var edtMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    @Environment(\.presentationMode) var presentMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                if edtMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        edtMode?.animation().wrappedValue = .inactive
                    }
                    .foregroundColor(.red)
                    .bold()
                }
                EditButton()
                    .tint(.myCustomColor)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .foregroundColor(.myCustomColor)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        presentMode.wrappedValue.dismiss()
                    }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            if edtMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
                    .padding()
            } else {
                ProfileEditorView(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
