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
    static var store: Store {
        Store(path: "/store")
    }

    struct Store {
        /// Path: `/store`
        public let path: String
    }
}
