import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    var onSave: ((ToDo) -> Void)?

    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else { return }
        let todo = ToDo(id: Int.random(in: 1000...9999),
                        title: text,
                        completed: false,
                        userID: 1)
        onSave?(todo)
        navigationController?.popViewController(animated: true)
    }
}
