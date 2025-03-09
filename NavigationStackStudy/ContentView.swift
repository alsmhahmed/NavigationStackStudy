//
//  ContentView.swift
//  NavigationStackStudy
//
//  Created by alsmh ahmed on 09/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    var platforms: [Platform] = [ .init(name: "Xbox", imageName: "xbox.logo", color: .green),
                                  .init(name: "PlayStation", imageName: "playstation.logo", color: .indigo),
                                  .init(name: "PC", imageName: "pc", color: .pink),
                                  .init(name: "Mobile", imageName: "iphone", color: .mint)]
    var body: some View {
        NavigationStack {
            List{
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle).bold()
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}



struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}
