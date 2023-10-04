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
    static var pet: Pet {
        Pet(path: "/pet")
    }

    struct Pet {
        /// Path: `/pet`
        public let path: String

        /// Add a new pet to the store
        public func post(_ body: iOLAP.Pet) -> Request<iOLAP.Pet> {
            Request(path: path, method: "POST", body: body, id: "addPet")
        }

        /// Update an existing pet
        ///
        /// Update an existing pet by Id
        public func put(_ body: iOLAP.Pet) -> Request<iOLAP.Pet> {
            Request(path: path, method: "PUT", body: body, id: "updatePet")
        }
    }
}
