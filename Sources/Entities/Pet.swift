//
// iOLAP is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 iOLAP.
//

import Foundation

public struct Pet: Codable, Identifiable {
    public var category: Category?
    /// Example: 10
    public var id: Int?
    /// Example: "doggie"
    public var name: String
    public var photoURLs: [String]
    /// Pet status in the store
    public var status: Status?
    public var tags: [Tag]?

    /// Pet status in the store
    public enum Status: String, Codable, CaseIterable {
        case available
        case pending
        case sold
    }

    public init(category: Category? = nil, id: Int? = nil, name: String, photoURLs: [String], status: Status? = nil, tags: [Tag]? = nil) {
        self.category = category
        self.id = id
        self.name = name
        self.photoURLs = photoURLs
        self.status = status
        self.tags = tags
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        category = try values.decodeIfPresent(Category.self, forKey: "category")
        id = try values.decodeIfPresent(Int.self, forKey: "id")
        name = try values.decode(String.self, forKey: "name")
        photoURLs = try values.decode([String].self, forKey: "photoUrls")
        status = try values.decodeIfPresent(Status.self, forKey: "status")
        tags = try values.decodeIfPresent([Tag].self, forKey: "tags")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(category, forKey: "category")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encode(name, forKey: "name")
        try values.encode(photoURLs, forKey: "photoUrls")
        try values.encodeIfPresent(status, forKey: "status")
        try values.encodeIfPresent(tags, forKey: "tags")
    }
}
