import SwiftUI
import UIKit

#if DEBUG

struct ExampleView: View {
  @State private var query: String = ""

  var body: some View {
    List {
      ForEach(TestFruits.allCases, id: \.self) {
        if query != "" {
          if $0.rawValue.contains(query) {
            Text($0.rawValue)
          }
        } else {
          Text($0.rawValue)
        }
      }
    }
    .searchable(query: $query)
  }
}

private enum TestFruits: String, CaseIterable {
  case apple, orange, banana, kiwi, melon, watermelon, lime, lemmon, tangerine
}

struct ExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView()
  }
}

#endif
