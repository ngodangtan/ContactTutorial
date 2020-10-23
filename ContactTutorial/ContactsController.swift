//
//  ContactsController.swift
//  ContactTutorial
//
//  Created by Ngo Dang tan on 10/23/20.
//

import UIKit

private let reuseIdentifier = "Cell"

class ContactsController: UITableViewController {
    
    // MARK: - Properties
    private var contacts = [Contact]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Contact"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
    @objc func handleAddContact(){
        let controller = AddContactController()
        controller.delegate = self
        
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    // MARK: - UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].fullname
        return cell
    }
}

extension ContactsController: AddContactDelegate {
    
    func addContact(contact: Contact) {
        self.dismiss(animated: true) {
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
    }
}
