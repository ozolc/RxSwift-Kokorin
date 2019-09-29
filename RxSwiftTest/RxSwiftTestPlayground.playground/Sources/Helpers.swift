import Foundation

public func example(_ rxOperator: String, action: () -> ()) {
    print("\n--- Example of:", rxOperator, "---")
    action()
}
