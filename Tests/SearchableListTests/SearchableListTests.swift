import XCTest
import SwiftUI
@testable import SearchableList
import SnapshotTesting

final class SearchableListTests: XCTestCase {
  func testSearchableListNoFilter() {
    let query = ""
    
    var list: some View {
      List {
        ForEach(Starks.allCases, id: \.self) {
          if query != "" {
            if $0.rawValue.contains(query) {
              Text($0.rawValue)
            }
          } else {
            Text($0.rawValue)
          }
        }
      }
      .searchable(query: .constant(query))
    }
    assertSnapshot(matching: list, as: .image(layout: .device(config: .iPhone8)))
  }
  
  func testSearchableListWithFilter() {
    let query = "brandon"
    
    var list: some View {
      List {
        ForEach(Starks.allCases, id: \.self) {
          if query != "" {
            if $0.rawValue.contains(query) {
              Text($0.rawValue)
            }
          } else {
            Text($0.rawValue)
          }
        }
      }
      .searchable(query: .constant(query))
    }
    assertSnapshot(matching: list, as: .image(layout: .device(config: .iPhone8)), record: true)
  }
}

extension SearchableListTests {
  enum Starks: String, CaseIterable {
    case eddard, catelyn, robb, jon, sansa, arya, brandon, rickon
  }
}


