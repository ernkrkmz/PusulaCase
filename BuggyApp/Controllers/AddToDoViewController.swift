import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var onSave: ((ToDo) -> Void)?
    
    // save butonunun üstünde gizli View vardı butona tıklanmıyordu onu kaldırdım
    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else {
            AlertManager.shared.showAlert(
                on: self,
                title: "Uyarı",
                message: "Lütfen bir başlık girin."
            )
            return
        }
        let finalText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Globals.shared.incrementLastId()
        let todo = ToDo(id: Globals.shared.lastId ?? Int.random(in: 1000...9999),
                        title: finalText,
                        completed: false,
                        userID: Globals.shared.userId)  // kendi IDmize göre gönderiyoruz
        
        print(todo)
        onSave?(todo)
        navigationController?.popViewController(animated: true)
    }
}
