//
//  ContentView.swift
//  invitation
//
//  Created by 최태욱 on 2023/08/08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var landmarks = landmarksData
    @State private var selectedTab: Tab = .house
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                switch selectedTab {
                case .house:
                    NavigationView {
                        ClearBackgroundListView()
                            .navigationBarTitle("Landmarks")
                    }
                    .navigationViewStyle(.stack)
                    .ignoresSafeArea(.all)
                    .background(Color.clear)
                    
                    
                case .message:
                    NavigationView {
                        Text("메시지 탭 내용")
                            .navigationBarTitle("메시지")
                    }
                    
                case .person:
                    NavigationView {
                        Text("사용자 탭 내용")
                            .navigationBarTitle("사용자")
                    }
                    
                case .leaf:
                    NavigationView {
                        Text("리프 탭 내용")
                            .navigationBarTitle("리프")
                    }
                    
                case .gearshape:
                    NavigationView {
                        Text("기어 모양 탭 내용")
                            .navigationBarTitle("기어 모양")
                    }
                }
                
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            CustomTabBar(selectedTab: $selectedTab)
                .background(Color.clear) // Set TabView background to clear
            
            
        }
        
    }
}


struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            Image(landmark.thumbnailName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(landmark.title)
                    .font(.headline)
                Text(landmark.country)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(landmark.flagName)
                .resizable()
                .frame(width: 30, height: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let pastelBlue = Color(red: 155/255, green: 204/255, blue: 250/255)
    static let pastelGreen = Color(red: 164/255, green: 249/255, blue: 164/255)
}


struct ClearBackgroundListView: View {
    var body: some View {
        List() {
            ForEach(CategoriesData) { category in
                Section(header: Text(category.title)) {
                    ForEach(category.landmarks) { landmark in
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }.scrollContentBackground(.hidden)
            .listStyle(DefaultListStyle()) // Set the list style
            .background(LinearGradient(
                gradient: Gradient(colors: [Color.pastelBlue, Color.pastelGreen]),
                startPoint: .top,
                endPoint: .bottom
            )
                .edgesIgnoringSafeArea(.all))
    }
}
