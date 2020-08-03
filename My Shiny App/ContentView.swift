//
//  ContentView.swift
//  My Shiny App
//
//  Created by Stewart Lynch on 2020-08-02.
//

import SwiftUI

struct ContentView: View {
    @State private var showWhatsNew = false
    var body: some View {
        NavigationView {
            Image("tech-junkie")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity, alignment: .center)
                .padding()
                .navigationTitle("My Shiny App")
                .navigationBarItems(trailing: Button(action: {
                    showWhatsNew = true
                })
                {
                    Image(systemName: "info.circle.fill").font(.largeTitle)
                })
        }
        .sheet(isPresented: $showWhatsNew) {
            WhatsNew()
        }
        .onAppear {
            showWhatsNew = WhatsNewViewModel.shouldShowScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
