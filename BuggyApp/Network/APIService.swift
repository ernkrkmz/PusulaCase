import Foundation

protocol APIServiceDelegate: AnyObject {
    func didFetchTodos(_ todos: [ToDo])
}

class APIService {
    weak var delegate: APIServiceDelegate?

    func fetchTodos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let todos = try? JSONDecoder().decode([ToDo].self, from: data)
                Globals.shared.setLastId(todos?.last?.id ?? 0)
                // Kullanıcıya özel filtreleme
                let filtered = todos?.filter { $0.userID == Globals.shared.userId}
                self.delegate?.didFetchTodos(filtered ?? [])
            }
        }.resume()
    }
}
