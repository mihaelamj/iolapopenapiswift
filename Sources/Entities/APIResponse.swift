//
// iOLAP is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 iOLAP.
//

import Foundation

public struct APIResponse: Codable {
    public var code: Int?
    public var message: String?
    public var type: String?

    public init(code: Int? = nil, message: String? = nil, type: String? = nil) {
        self.code = code
        self.message = message
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        code = try values.decodeIfPresent(Int.self, forKey: "code")
        message = try values.decodeIfPresent(String.self, forKey: "message")
        type = try values.decodeIfPresent(String.self, forKey: "type")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(code, forKey: "code")
        try values.encodeIfPresent(message, forKey: "message")
        try values.encodeIfPresent(type, forKey: "type")
    }
}
