//
//  WhatsNewItem.swift
//  My Shiny App
//
//  Created by Stewart Lynch on 2020-08-03.
//

import Foundation

struct WhatsNewItem: Identifiable {
    let id = UUID()
    let versionNumber: Double
    let versionTitle: String
    let description: String
}
