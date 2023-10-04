//
// iOLAP is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 iOLAP.
//

import Foundation

public struct User: Codable, Identifiable {
    /// Example: "john@email.com"
    public var email: String?
    /// Example: "John"
    public var firstName: String?
    /// Example: 10
    public var id: Int?
    /// Example: "James"
    public var lastName: String?
    /// Example: "12345"
    public var password: String?
    /// Example: "12345"
    public var phone: String?
    /// User Status
    public var userStatus: Int?
    /// Example: "theUser"
    public var username: String?

    public init(email: String? = nil, firstName: String? = nil, id: Int? = nil, lastName: String? = nil, password: String? = nil, phone: String? = nil, userStatus: Int? = nil, username: String? = nil) {
        self.email = email
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.password = password
        self.phone = phone
        self.userStatus = userStatus
        self.username = username
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        email = try values.decodeIfPresent(String.self, forKey: "email")
        firstName = try values.decodeIfPresent(String.self, forKey: "firstName")
        id = try values.decodeIfPresent(Int.self, forKey: "id")
        lastName = try values.decodeIfPresent(String.self, forKey: "lastName")
        password = try values.decodeIfPresent(String.self, forKey: "password")
        phone = try values.decodeIfPresent(String.self, forKey: "phone")
        userStatus = try values.decodeIfPresent(Int.self, forKey: "userStatus")
        username = try values.decodeIfPresent(String.self, forKey: "username")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(email, forKey: "email")
        try values.encodeIfPresent(firstName, forKey: "firstName")
        try values.encodeIfPresent(id, forKey: "id")
        try values.encodeIfPresent(lastName, forKey: "lastName")
        try values.encodeIfPresent(password, forKey: "password")
        try values.encodeIfPresent(phone, forKey: "phone")
        try values.encodeIfPresent(userStatus, forKey: "userStatus")
        try values.encodeIfPresent(username, forKey: "username")
    }
}
