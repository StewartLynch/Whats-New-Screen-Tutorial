//
//  WhatsNewViewModel.swift
//  My Shiny App
//
//  Created by Stewart Lynch on 2020-08-03.
//

import SwiftUI

struct WhatsNewViewModel {
    @AppStorage("lastVersion") static var lastVersion = ""
    let title: String
    let intro: String
    let whatsNewItems: [WhatsNewItem]
    
    static var verString: String {
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        let appBuild = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
        return "\(appVersion) Build: \(appBuild)"
    }
    
    static func shouldShowScreen() -> Bool {
        if lastVersion != WhatsNewViewModel.verString {
            lastVersion = WhatsNewViewModel.verString
            return true
        } else {
            return false
        }
    }
    static func buildWhatsNew() -> WhatsNewViewModel {
        let whatsNewVM = WhatsNewViewModel(title: "My Shiny App",
                                           intro: "All that is new with this application.",
                                           whatsNewItems: [
                                            WhatsNewItem(versionNumber: 1.0,
                                                        versionTitle: "Initial Release",
                                                        description: """
✓ Feature 1
✓ Feature 2
✓ Feature 3
"""),
                                            WhatsNewItem(versionNumber: 1.1,
                                                        versionTitle: "🕷 Bug Fixes",
                                                        description: """
✓ Fixed Bug 1
✓ Fixed Bug 2
""")
                                           ])
        return whatsNewVM
    }
}
