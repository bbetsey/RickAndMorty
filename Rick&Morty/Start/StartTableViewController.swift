//
//  StartTableViewController.swift
//  Rick&Morty
//
//  Created by Антон Тропин on 17.05.23.
//

import UIKit

class StartTableViewController: UITableViewController {
	
	let characterCellID = "characterCell"

    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .lightGray
		
		// Title
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Rick & Morty"
		
		tableView.rowHeight = UITableView.automaticDimension
		
		tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.cellID)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: characterCellID, for: indexPath)
		cell.backgroundColor = .cyan
        return cell
    }


}
