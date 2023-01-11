//
//  CreateAccountView.swift
//  Standups
//
//  Created by GWE48A on 1/10/23.
//

import SwiftUI
import SwiftUINavigation

struct CreateAccountView: View {
  enum Field: Hashable {
    case email
    case password
  }
  @FocusState var focus: Field?
  @ObservedObject var model: CreateAccountModel
  
  var body: some View {
    Form {
      Section {
        TextField("Enter email", text: self.$model.newUser.email)
          .onSubmit {
            model.newUserTappedReturn()
          }
          .focused(self.$focus, equals: .email)
        TextField("Create password", text: self.$model.newUser.password)
          .onSubmit {
            model.newUserTappedReturn()
          }
          .focused(self.$focus, equals: .password)
      }
    header: {
      Text("Create account with email and passworrd")
    }
      
      Section {
        Button("Create my account") {
          model.onCreateMyAccountTapped()
        }
        .frame(maxWidth: .infinity)
      }
    }
    .bind(self.$model.focus, to: self.$focus)
  }
}


