//
//  LoginScreen.swift
//  StudCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {

    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Username.."
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        
        return textField
    }()
    private var passTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password.."
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton();
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func login(){
        var stud = [Stud]()
        if(nameTextField.text == "Admin" && passTextField.text == "Admin"){
            let s1 = AdminDashboard()
            navigationController?.pushViewController(s1, animated: true)
        }
        else
        {
            let spid = Int(nameTextField.text!)
            let pwd = passTextField.text!
            stud = CoreDataHandler.shared.loginstud(spid: spid!)
            var id = stud[0].spid
            var p = stud[0].password
            
            if(p == pwd )
            {
               let vc = StudentHome()
                UserDefaults.standard.set(spid, forKey: "Id")
                navigationController?.pushViewController(vc, animated: true)
            }
            
            
            
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bgrecipi")!)
        view.addSubview(nameTextField)
        view.addSubview(passTextField)
        view.addSubview(loginButton)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Backgroung.png") ?
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        nameTextField.frame = CGRect(x: 40, y: 225, width: view.width - 80, height: 40)
        passTextField.frame = CGRect(x: 40 ,y: 275, width: view.width - 80, height: 40)
        loginButton.frame = CGRect(x: 60, y: 350, width: view.width - 120, height: 40)
    }
    
    
    
}

