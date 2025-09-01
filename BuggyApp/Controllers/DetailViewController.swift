import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var todo: ToDo!
    var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = todo.title
    }
}
