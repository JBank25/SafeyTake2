//
//  ContentView.swift
//  Safety-22
//
//  Created by Joshua Urbank on 10/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            TabView{
                NavigationView{
                    WorldView()
                }
                .tabItem{
                    Text("Location")
                }
            }
        }
}
