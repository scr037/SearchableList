import SwiftUI
import UIKit

public struct SearchableListModifier: ViewModifier {
  public var query: Binding<String>
  
  public init(query: Binding<String>) {
    self.query = query
  }

  public func body(content: Content) -> some View {
    VStack {
      SearchBar(coordinator: .init(query: query))
      content
    }
  }
}

public final class Coordinator: NSObject, UISearchBarDelegate {
  var searchBar: UISearchBar
  var query: Binding<String>

  init(query: Binding<String>) {
    self.searchBar = UISearchBar()
    self.query = query

    super.init()
    searchBar.delegate = self
  }
  
  public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    query.wrappedValue = searchText
  }
}

private struct SearchBar: UIViewRepresentable {
  typealias UIViewType = UISearchBar

  var coordinator: Coordinator

  func makeUIView(context: Context) -> UISearchBar {
    coordinator.searchBar
  }
  
  func updateUIView(_ uiView: UISearchBar, context: Context) {
    coordinator.searchBar.text = coordinator.query.wrappedValue
    coordinator.searchBar.autocapitalizationType = .none
    coordinator.searchBar.autocorrectionType = .no
  }
  
  func makeCoordinator() -> Coordinator {
    coordinator
  }
}
