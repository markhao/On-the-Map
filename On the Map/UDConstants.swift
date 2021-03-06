//
//  UDConstants.swift
//  On the Map
//
//  Created by Yu Qi Hao on 5/19/16.
//  Copyright © 2016 Yu Qi Hao. All rights reserved.
//

import Foundation

extension UDClient {
    
    struct Constants {
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "www.udacity.com"
        static let ApiPath = "/api"
        static let SignUpURL = "https://www.udacity.com/account/auth#!/signup"
    }
    
    struct Methods {
        static let Session = "/session"
        static let Users = "/users"
    }
    
    struct ResponseKeys {
        static let Session = "session"
        static let SessionId = "id"
        static let Account = "account"
        static let Key = "key"
        static let User = "user"
        static let FirstName = "first_name"
        static let LastName = "last_name"
    }

}