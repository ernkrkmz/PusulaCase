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
    
    func populate(with toDo: ToDo) {
        titleLabel.text = toDo.title
        if !completedSwitch.isOn {
            completedSwitch.isOn = toDo.completed
        }
    }
}
