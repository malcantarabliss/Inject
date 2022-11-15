//
//  ContentView.swift
//  test
//
//  Created by Miguel Alcântara on 15/11/2022.
//

import SwiftUI
import Inject

struct ContentView: View {
    @ObserveInjection var inject
//    @ObservedObject var iO = Inject.observer

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .foregroundColor(.red)
        }
        .padding()
        .enableInjection()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
