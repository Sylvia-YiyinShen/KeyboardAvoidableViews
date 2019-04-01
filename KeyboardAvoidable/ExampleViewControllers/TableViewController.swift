//
//  TableViewController.swift
//  KeyboardAvoidable
//
//  Created by Zhihui Sun on 1/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: KeyboardAvoidableTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let textFiled = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textFiled.text = String("This is cell at row: \(indexPath.row)")
        cell.contentView.addSubview(textFiled)
        return cell
    }
}
