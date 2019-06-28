//
//  LocalizableHelper.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 02/05/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import Foundation

enum LocalizableHelper {
    
    static var language = Bundle.main.preferredLocalizations.first {
        didSet {
            if
                let path = Bundle.main.path(forResource: self.language?.lowercased() ?? "Base", ofType: "lproj"),
                let languageBundle = Bundle(path: path)
            {
                self.languageBundle = languageBundle
            } else {
                self.languageBundle = Bundle.main
            }
        }
    }
    
    private(set) static var languageBundle: Bundle = Bundle.main
    
}

extension String {
    var systemLocalized: String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
    
    var localized: String {
        return LocalizableHelper.languageBundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
