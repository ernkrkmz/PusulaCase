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
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        apiService.delegate = self
        apiService.fetchTodos()
    }
    
    @objc func addTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "AddToDoViewController") as! AddToDoViewController
        addVC.onSave = { [weak self] todo in
            self?.todos.append(todo)
            self?.todos.sort { $0.id > $1.id }
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
        cell.selectionStyle = .none
        
        cell.onToggle = { [weak self] isOn in
            self?.todos[indexPath.row] = ToDo(
                id: todo.id,
                title: todo.title,
                completed: isOn,
                userID: todo.userID
            )
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.todo = todos[indexPath.row] // burası değişti
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil" // Gerekirse Localization için
    }
}

extension ToDoListViewController: APIServiceDelegate {
    func didFetchTodos(_ todos: [ToDo]) {
        DispatchQueue.main.async { // burası değişti
            self.todos = todos.sorted { $0.id > $1.id }
            self.tableView.reloadData()
        }
    }
}
