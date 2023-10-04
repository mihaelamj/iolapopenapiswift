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

public extension Paths.Pet.WithPetID {
    var uploadImage: UploadImage {
        UploadImage(path: path + "/uploadImage")
    }

    struct UploadImage {
        /// Path: `/pet/{petId}/uploadImage`
        public let path: String

        /// Uploads an image
        public func post(additionalMetadata: String? = nil, _ body: Data? = nil) -> Request<iOLAP.APIResponse> {
            Request(path: path, method: "POST", query: makePostQuery(additionalMetadata), body: body, id: "uploadFile")
        }

        private func makePostQuery(_ additionalMetadata: String?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(additionalMetadata, forKey: "additionalMetadata")
            return encoder.items
        }
    }
}
