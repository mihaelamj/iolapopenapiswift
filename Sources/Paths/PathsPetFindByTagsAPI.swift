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
    var findByTags: FindByTags {
        FindByTags(path: path + "/findByTags")
    }

    struct FindByTags {
        /// Path: `/pet/findByTags`
        public let path: String

        /// Finds Pets by tags
        ///
        /// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
        public func get(tags: [String]? = nil) -> Request<[iOLAPPetStore.Pet]> {
            Request(path: path, method: "GET", query: makeGetQuery(tags), id: "findPetsByTags")
        }

        private func makeGetQuery(_ tags: [String]?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(tags, forKey: "tags")
            return encoder.items
        }
    }
}
