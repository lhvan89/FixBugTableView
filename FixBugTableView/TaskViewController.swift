//
//  TaskViewController.swift
//  FixBugTableView
//
//  Created by Van Le on 11/2/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DetailTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTaskTableViewCell")
        tableView.register(UINib(nibName: "AttachedFilesTableViewCell", bundle: nil), forCellReuseIdentifier: "AttachedFilesTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 10
    }
}

extension TaskViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTaskTableViewCell") as? DetailTaskTableViewCell else { return UITableViewCell() }
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachedFilesTableViewCell") as? AttachedFilesTableViewCell else { return UITableViewCell() }
//            cell.updateHeightContain()
            
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            
            cell.collectionView.reloadData()
            
            cell.collectionViewHeightConstraint.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
            
            
            return cell
        }
        return UITableViewCell()
    }
    
}
