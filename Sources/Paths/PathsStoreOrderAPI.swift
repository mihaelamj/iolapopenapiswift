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
    var order: Order {
        Order(path: path + "/order")
    }

    struct Order {
        /// Path: `/store/order`
        public let path: String

        /// Place an order for a pet
        ///
        /// Place a new order in the store
        public func post(_ body: iOLAP.Order? = nil) -> Request<iOLAP.Order> {
            Request(path: path, method: "POST", body: body, id: "placeOrder")
        }
    }
}
