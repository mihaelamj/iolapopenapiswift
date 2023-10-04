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

public extension Paths.Store {
    var inventory: Inventory {
        Inventory(path: path + "/inventory")
    }

    struct Inventory {
        /// Path: `/store/inventory`
        public let path: String

        /// Returns pet inventories by status
        ///
        /// Returns a map of status codes to quantities
        public var get: Request<[String: Int]> {
            Request(path: path, method: "GET", id: "getInventory")
        }
    }
}
