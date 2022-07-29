# SearchableList

## Description

A convenience modifier that adds a `UISearchBar` on top of a SwiftUI List and allows filtering its content with a query (a binding string).

## Description

The `SearchableList` relies on `ViewModifier` and `UIViewRepresentable` (accessible only through lists using `.searchable(query:)`) in order to allow users to easily filter the list`s content.

# Usage

```swift
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
```

## Preview

### Looking for Starks

| No Filter | Filter |
| --- | --- |
| <img width="375" alt="testSearchableListNoFilter 1" src="https://user-images.githubusercontent.com/20460404/181795972-b9aa80ab-5f87-4e50-86bc-603778ab2a2c.png"> | <img width="375" alt="testSearchableListWithFilter 1" src="https://user-images.githubusercontent.com/20460404/181795984-100d6a45-7af6-40d5-b0f4-4d0fb34ed4ef.png"> |
