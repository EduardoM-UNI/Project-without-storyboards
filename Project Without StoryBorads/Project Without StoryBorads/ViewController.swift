//
//  ViewController.swift
//  Project Without StoryBorads
//
//  Created by Eduardo Monroy Husillos on 13/6/21.
//

import UIKit
import PureLayout

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var profileView: UIView = {
        return ProfileView(tableView: self.tableView)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "Eduardo Monroy"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.profileView)
        self.profileView.autoPinEdgesToSuperviewEdges()
        self.view.layoutIfNeeded()
        
        DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        
    }
    
    let profileInfoCellReuseIdentifier = "profileInfoCellReuseIdentifier"
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: profileInfoCellReuseIdentifier)
       
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileInfoCellReuseIdentifier, for: indexPath) as! ProfileInfoTableViewCell
          
        
        
        switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Phone Number"
                cell.descriptionLabel.text = "+34661573380"
            case 1:
                cell.titleLabel.text = "Email"
                cell.descriptionLabel.text = "edu.wap2@gmail.com"
            case 2:
                cell.titleLabel.text = "LinkedIn"
                cell.descriptionLabel.text = "www.linkedin.com/Eduardo-Monroy"
        case 3:
            cell.titleLabel.text = "Address"
            cell.descriptionLabel.text = "C/Santiago de Compostela Nº 28BIS\n08204, Sabadell (BARCELONA)"
            default:
                break
            }
            
            return cell
    }
    

}
