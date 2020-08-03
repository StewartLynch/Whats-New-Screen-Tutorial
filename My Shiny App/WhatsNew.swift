//
//  WhatsNew.swift
//  My Shiny App
//
//  Created by Stewart Lynch on 2020-08-03.
//

import SwiftUI

struct WhatsNew: View {
    var whatsNewVM = WhatsNewViewModel.buildWhatsNew()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text(whatsNewVM.title).font(.title)
                    Text(whatsNewVM.intro)
                }
                ForEach(whatsNewVM.whatsNewItems.reversed()) { item in
                    VStack(alignment: .leading, spacing: 3.0) {
                        Text("VERSION: \(item.versionNumber, specifier: "%.2f")")
                            .font(.caption)
                            .fontWeight(.bold)
                        Text(item.versionTitle)
                            .font(.headline)
                        Text(item.description)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
                .navigationTitle("What's New")
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("✖︎").font(.largeTitle)
                }))
        }
    }
}

struct WhatsNew_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNew()
    }
}
