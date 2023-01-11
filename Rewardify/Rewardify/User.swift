//
//  User.swift
//  Standups
//
//  Created by GWE48A on 1/10/23.
//

import Foundation

struct User: Equatable, Identifiable, Codable {
  var id = UUID()
  var email: String
  var password: String
  var rewardsNumber: String
}

extension User {
  static let mock = User(email: "jonny@mail.com", password: "password", rewardsNumber: "w39fhw")
  static var blank = User.init(email: "", password: "", rewardsNumber: "")
}
