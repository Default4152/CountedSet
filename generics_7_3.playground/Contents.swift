import Cocoa

struct CountedSet<Key: Hashable> {
  subscript(_ member: Key) -> Int {
    return items[member] ?? 0
  }
  
  mutating func insert(key: Key) {
    items[key] = items[key, default: 0] + 1
  }
  
  mutating func remove(key: Key) {
    items[key] = items[key, default: 0] - 1
  }
  
  func count(key: Key) -> Int {
    return items[key, default: 0]
  }
  
  internal var items: [Key: Int] = [:]
}

enum Arrow {
  case iron
  case wooden
  case elven
  case dwarvish
  case magic
  case silver
}

var aCountedSet = CountedSet<Arrow>()
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]

aCountedSet.insert(key: .iron)
aCountedSet.insert(key: .iron)
print(aCountedSet)
print(myCountedSet[.iron])

extension CountedSet: ExpressibleByArrayLiteral {
  public init(arrayLiteral: Key...) {
    self.items = [:]
    for key in arrayLiteral {
      self.items[key] = items[key, default: 0] + 1
    }
  }
}
