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

public extension Paths {
    static var user: User {
        User(path: "/user")
    }

    struct User {
        /// Path: `/user`
        public let path: String

        /// Create user
        ///
        /// This can only be done by the logged in user.
        public func post(_ body: iOLAP.User? = nil) -> Request<iOLAP.User> {
            Request(path: path, method: "POST", body: body, id: "createUser")
        }
    }
}
