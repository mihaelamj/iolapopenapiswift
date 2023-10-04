//
// iOLAP is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 iOLAP.
//

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

public extension Paths.User {
    var login: Login {
        Login(path: path + "/login")
    }

    struct Login {
        /// Path: `/user/login`
        public let path: String

        /// Logs user into the system
        public func get(username: String? = nil, password: String? = nil) -> Request<String> {
            Request(path: path, method: "GET", query: makeGetQuery(username, password), id: "loginUser")
        }

        public enum GetResponseHeaders {
            /// Calls per hour allowed by the user
            public static let rateLimit = HTTPHeader<Int>(field: "X-Rate-Limit")
            /// Date in UTC when token expires
            public static let expiresAfter = HTTPHeader<Date>(field: "X-Expires-After")
        }

        private func makeGetQuery(_ username: String?, _ password: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(username, forKey: "username")
            encoder.encode(password, forKey: "password")
            return encoder.items
        }
    }
}
