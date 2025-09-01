import Foundation

struct ToDo: Codable {
    let id: Int
    let title: String
    let completed: Bool
    let userID: Int
}
