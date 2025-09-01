import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var todos: [ToDo] = []
    let apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ToDos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
        apiService.delegate = self
        apiService.fetchTodos()
    }
    
    @objc func addTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "AddToDoViewController") as! AddToDoViewController
        addVC.onSave = { [weak self] todo in
            self?.todos.append(todo)
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(addVC, animated: true)
    }
}


extension ToDoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        let todo = todos[indexPath.row]
        cell.populate(with: todo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.todo = todos[indexPath.section]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ToDoListViewController: APIServiceDelegate {
    func didFetchTodos(_ todos: [ToDo]) {
        self.todos = todos
    }
}
