//
//  SharedUserDefaults.swift
//  App-Push-Test
//
//  Created by junehee on 10/21/24.
//

import Foundation

extension UserDefaults {
    static var groupShared: UserDefaults {
        let appID = "group.com.junehee.test"
        return UserDefaults(suiteName: appID)!
    }
}
