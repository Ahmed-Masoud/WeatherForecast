//
//  Notification+Name.swift
//  VitalCheckUp-IOS
//
//  Created by Ahmed Masoud on 1/19/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let didChangeConnection = Notification.Name("DidChangeConnection")
    static let apiConnectionFailure = Notification.Name("ApiConnectionFailure")
    static let dynamicLinkResponse = Notification.Name("DynamicLinkResponse")
    static let didChangeUserInfo = Notification.Name("DidChangeUserInfo")
}
