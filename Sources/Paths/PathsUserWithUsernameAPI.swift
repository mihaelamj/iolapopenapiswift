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
    func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    struct WithUsername {
        /// Path: `/user/{username}`
        public let path: String

        /// Get user by user name
        public var get: Request<iolapopenapiswift.User> {
            Request(path: path, method: "GET", id: "getUserByName")
        }

        /// Update user
        ///
        /// This can only be done by the logged in user.
        public func put(_ body: iolapopenapiswift.User? = nil) -> Request<Void> {
            Request(path: path, method: "PUT", body: body, id: "updateUser")
        }

        /// Delete user
        ///
        /// This can only be done by the logged in user.
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "deleteUser")
        }
    }
}
