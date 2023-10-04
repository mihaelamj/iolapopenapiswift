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

public extension Paths.Pet {
    func petID(_ petID: Int) -> WithPetID {
        WithPetID(path: "\(path)/\(petID)")
    }

    struct WithPetID {
        /// Path: `/pet/{petId}`
        public let path: String

        /// Find pet by ID
        ///
        /// Returns a single pet
        public var get: Request<iolapopenapiswift.Pet> {
            Request(path: path, method: "GET", id: "getPetById")
        }

        /// Updates a pet in the store with form data
        public func post(name: String? = nil, status: String? = nil) -> Request<Void> {
            Request(path: path, method: "POST", query: makePostQuery(name, status), id: "updatePetWithForm")
        }

        private func makePostQuery(_ name: String?, _ status: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(name, forKey: "name")
            encoder.encode(status, forKey: "status")
            return encoder.items
        }

        /// Deletes a pet
        public var delete: Request<Void> {
            Request(path: path, method: "DELETE", id: "deletePet")
        }
    }
}
