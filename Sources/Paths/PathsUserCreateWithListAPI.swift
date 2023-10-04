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
    var createWithList: CreateWithList {
        CreateWithList(path: path + "/createWithList")
    }

    struct CreateWithList {
        /// Path: `/user/createWithList`
        public let path: String

        /// Creates list of users with given input array
        public func post(_ body: [iOLAPPetStore.User]? = nil) -> Request<iOLAPPetStore.User> {
            Request(path: path, method: "POST", body: body, id: "createUsersWithListInput")
        }
    }
}
