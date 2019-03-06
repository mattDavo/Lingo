//
//  File.swift
//  Lingo
//
//  Created by Matthew Davidson on 6/3/19.
//  Copyright © 2019 MatthewDavidson. All rights reserved.
//

import Foundation
import os.log

extension String {
    
    func localized(bundle: Bundle = Bundle(identifier: "MatthewDavidson.Lingo")!, tableName: String = "Localizable") -> String {
        
        let localizedString = NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
        
        if localizedString == "**\(self)**" {
            os_log(OSLogType.error, "Failed to localize string. key=%s, tableName=%s, language=%s", self, tableName, Locale.current.languageCode ?? "en")
        }
        
        return localizedString
    }
}
