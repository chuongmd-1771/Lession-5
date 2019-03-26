//
//  ViewController.swift
//  Tableview-Exercise
//
//  Created by mai.dinh.chuong on 3/22/19.
//  Copyright © 2019 Sun-Asterisk Inc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var dataCell = [CellData]()
    let cellID = "TableViewCell"
    let tableSection : [CellData] = []
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        refeshActive()
    }
    
    func setupTableView()
    {
        self.tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        dataCell = [CellData(detail: "Apple", text: "lajsldijljasdlj", images: #imageLiteral(resourceName: "Cantaloupe")),
                    CellData(detail: "Apricot", text: "lajsldijlohwih", images: #imageLiteral(resourceName: "Apple"))]
        
        
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
    }
    
    func refeshActive()
    {
        refresh.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresh.addTarget(self, action: #selector(refreshed), for: .valueChanged)
        self.tableView.addSubview(refresh)
    }
    
    @objc func refreshed()
    {
        tableView.reloadData()
        refresh.endRefreshing()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "header"
        label.backgroundColor = .lightGray
        return label
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCell.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        
        cell.imageViews.image = dataCell[indexPath.row].images
        cell.titleText.text = dataCell[indexPath.row].detail
        cell.detailText.text = dataCell[indexPath.row].text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataCell.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
}


