//
//  ProfileView.swift
//  Project Without StoryBorads
//
//  Created by Eduardo Monroy Husillos on 13/6/21.
//

import UIKit

class ProfileView: UIView {
    
    var tableView: UITableView!
    
    lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Foto_Edu_Traje"))
        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = 64.0
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var upperView: UIView = {
        let view = UIView()
        view.autoSetDimension(.height, toSize: 100)
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Personal", "Social", "Resumè"])
        control.autoSetDimension(.height, toSize: 32.0)
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.gray.cgColor
        control.tintColor = .lightGray
        return control
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.tintColor = .gray
        button.backgroundColor = .clear
        button.autoSetDimension(.width, toSize: 96.0)
        button.autoSetDimension(.height, toSize: 32.0)
        return button
    }()
    
    func addSubviews() {
        
        addSubview(upperView)
        addSubview(avatar)
        addSubview(segmentedControl)
        addSubview(editButton)
        addSubview(tableView)
    }
    
     init(tableView: UITableView) {
        super.init(frame: .zero)
          self.tableView = tableView
        addSubviews()
        bringSubviewToFront(avatar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        avatar.autoAlignAxis(toSuperviewAxis: .vertical)
        avatar.autoPinEdge(toSuperviewEdge: .top, withInset: 40.0)
        
        upperView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        segmentedControl.autoPinEdge(.top, to: .bottom, of: avatar, withOffset: 16.0)
        
        editButton.autoPinEdge(.top, to: .bottom, of: upperView, withOffset: 16.0)
        editButton.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        tableView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        tableView.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 8)
        
        super.updateConstraints() // Always at the bottom of the function
    }
}
