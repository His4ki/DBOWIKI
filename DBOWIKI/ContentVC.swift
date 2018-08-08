//
//  ContentVC.swift
//  DBOWIKI
//
//  Created by Kacper Kuźniak on 04/08/2017.
//  Copyright © 2017 Kacper Kuźniak. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {
    
    var tableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    var logoView: UIView = {
        let view = UIView()
        return view
    }()
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adult and Master Class Quest Guide"
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var menuLayoutIsHidden: Bool = false
    
    func showMenuLayout() {
        UIView.animate(withDuration: 0.3, animations: {
            self.tableView.alpha = 1
            self.logoView.alpha = 1
        })
    }
    
    var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    var scrollView: ContentScrollView = {
        let view = ContentScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.indicatorStyle = .white
        return view
    }()
    
    func addConstraintsForPosition(view: UIView, to: UIView, top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat, active: Bool) {
        
        view.topAnchor.constraint(equalTo: to.topAnchor, constant: top).isActive = active
        view.bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: bottom).isActive = active
        view.leftAnchor.constraint(equalTo: to.leftAnchor, constant: left).isActive = active
        view.rightAnchor.constraint(equalTo: to.rightAnchor, constant: right).isActive = active
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainView)
        self.view.addSubview(headerLabel)
        mainView.addSubview(cancelButton)
        mainView.addSubview(headerLabel)
        mainView.addSubview(separatorView)
        mainView.addSubview(scrollView)
        
        addConstraintsForPosition(view: mainView, to: self.view, top: 40, bottom: -10, left: 2, right: -2, active: true)
        
        cancelButton.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -5).isActive = true
        cancelButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 5).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        
        headerLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 5).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: cancelButton.leftAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalTo: cancelButton.heightAnchor).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 5).isActive = true
        separatorView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20).isActive = true
        separatorView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 5).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        scrollView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0).isActive = true
        
    }
    
    @objc func cancelButtonClicked() {
        dismiss(animated: true, completion: nil)
        showMenuLayout()
    }

}
