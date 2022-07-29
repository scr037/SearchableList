import SwiftUI

extension List {
  public func searchable(query: Binding<String>) -> some View {
    self.modifier(SearchableListModifier(query: query))
  }
}
