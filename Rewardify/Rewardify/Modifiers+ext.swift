//
//  Modifiers+ext.swift
//  Standups
//
//  Created by GWE48A on 1/10/23.
//

import SwiftUI

public struct NavBarModifier: ViewModifier {
  public var color: Color
  public var visibility: Visibility
  public var colorScheme: ColorScheme?
  public var displayMode: NavigationBarItem.TitleDisplayMode
  public func body(content: Content) -> some View {
    content
      .navigationBarTitleDisplayMode(displayMode)
      .toolbarColorScheme(colorScheme, for: .navigationBar)
      .toolbarBackground(color, for: .navigationBar)
      .toolbarBackground(visibility, for: .navigationBar)
  }
}

extension View {
  public func navDisplayed(with color: Color,
                           visibility: Visibility = .visible,
                           colorScheme: ColorScheme? = nil,
                           displayMode: NavigationBarItem.TitleDisplayMode = .automatic
  ) -> some View {
    return modifier(
      NavBarModifier(
        color: color,
        visibility: visibility,
        colorScheme: colorScheme,
        displayMode: displayMode)
    )
  }
}
