//
//  ProfileEditorView.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 12.09.2023.
//

import SwiftUI

struct ProfileEditorView: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                    .foregroundColor(.myCustomColor)
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
                    .foregroundColor(.myCustomColor)
                    .bold()
            }
            
            VStack(alignment: .leading) {
                Picker(selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                } label: {
                    Text("Seasonal Photo").bold()
                        .foregroundColor(.myCustomColor)
                }
                .pickerStyle(.menu)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
                    .foregroundColor(.myCustomColor)
            }
            
        }
        .tint(.myCustomColor)
        .listStyle(.inset)
    }
}

struct ProfileEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditorView(profile: .constant(.default))
    }
}
