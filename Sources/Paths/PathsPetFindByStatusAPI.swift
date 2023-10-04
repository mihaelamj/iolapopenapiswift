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
    var findByStatus: FindByStatus {
        FindByStatus(path: path + "/findByStatus")
    }

    struct FindByStatus {
        /// Path: `/pet/findByStatus`
        public let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        public func get(status: Status? = nil) -> Request<[iolapopenapiswift.Pet]> {
            Request(path: path, method: "GET", query: makeGetQuery(status), id: "findPetsByStatus")
        }

        private func makeGetQuery(_ status: Status?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(status, forKey: "status")
            return encoder.items
        }

        public enum Status: String, Codable, CaseIterable {
            case available
            case pending
            case sold
        }
    }
}
