import Foundation

struct ToDoItem : Codable, Equatable{
    var id = String(UUID().uuidString)
    let text: String
    var isCompleted: Bool
}
