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

public extension Paths.Store.Order {
    func orderID(_ orderID: Int) -> WithOrderID {
        WithOrderID(path: "\(path)/\(orderID)")
    }

    struct WithOrderID {
        /// Path: `/store/order/{orderId}`
        public let path: String

        /// Find purchase order by ID
        ///
        /// For valid response try integer IDs with value <= 5 or > 10. Other values will generate exceptions.
        public var get: Request<iOLAPPetStore.Order> {
            Request(path: path, method: "GET", id: "getOrderById")
        }

        /// Delete purchase order by ID
        ///
        /// For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "deleteOrder")
        }
    }
}
