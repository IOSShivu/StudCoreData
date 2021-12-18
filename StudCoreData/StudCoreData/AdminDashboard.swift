//
//  AdminDashboard.swift
//  StudCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AdminDashboard: UIViewController {

    private let studButton: UIButton = {
        let button = UIButton();
        button.setTitle("Student", for: .normal)
        button.addTarget(self, action: #selector(stud), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let noticeButton: UIButton = {
        let nbutton = UIButton();
        nbutton.setTitle("NoticeBoard", for: .normal)
        nbutton.addTarget(self, action: #selector(notice), for: .touchUpInside)
        nbutton.tintColor = .white
        nbutton.backgroundColor = .blue
        nbutton.layer.cornerRadius = 6
        return nbutton
    }()
    private let searchButton: UIButton = {
        let nbutton = UIButton();
        nbutton.setTitle("Search Student", for: .normal)
        nbutton.addTarget(self, action: #selector(searchstudent), for: .touchUpInside)
        nbutton.tintColor = .white
        nbutton.backgroundColor = .blue
        nbutton.layer.cornerRadius = 6
        return nbutton
    }()
    
    @objc func stud()
    {
       let d1 = StudList()
        navigationController?.pushViewController(d1, animated: true)    }
    
    @objc func notice()
    {
        let n1 = ListNotice()
        navigationController?.pushViewController(n1, animated: true)
    }
    @objc func searchstudent()
    {
        let n1 = Searchstudent()
        navigationController?.pushViewController(n1, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(studButton)
        view.addSubview(noticeButton)
        view.addSubview(searchButton)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        studButton.frame = CGRect(x: 40, y: 60, width: view.width - 120, height: 40)
        noticeButton.frame = CGRect(x: 40, y: studButton.bottom + 10, width: view.width - 120, height: 40)
        searchButton.frame = CGRect(x: 40, y: noticeButton.bottom + 10, width: view.width - 120, height: 40)
    }
}



