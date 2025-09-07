//
//  ToDoCell.swift
//  BuggyApp
//
//  Created by Mehmet Akif Şengül on 27.08.2025.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    var onToggle: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        completedSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }
    
    func populate(with toDo: ToDo) {
        titleLabel.text = toDo.title
        titleLabel.textColor = .clrText
        titleLabel.numberOfLines = 0
        completedSwitch.isOn = toDo.completed
        
    }
    
    @objc private func switchChanged(_ sender: UISwitch) {
        onToggle?(sender.isOn) 
    }
}
