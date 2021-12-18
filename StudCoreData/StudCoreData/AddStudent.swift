//
//  AddStudent.swift
//  StudCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AddStudent: UIViewController {

    var stud:Stud?
    private var Spidtxt : UITextField = {
        let txt = UITextField()
        txt.placeholder =  "Enter SPID"
        txt.textAlignment = .center
        txt.backgroundColor = .lightGray
        return txt
    }()
    private var nametxt : UITextField = {
        let txt = UITextField()
        txt.placeholder =  "Enter Name"
        txt.textAlignment = .center
        txt.backgroundColor = .lightGray
        return txt
    }()
    
    
    private var addtxt : UITextField = {
        let txt = UITextField()
        txt.placeholder =  "Enter Address"
        txt.textAlignment = .center
        txt.backgroundColor = .lightGray
        return txt
    }()
    
    private var classtxt : UITextField = {
        let txt = UITextField()
        txt.placeholder =  "Enter Class"
        txt.textAlignment = .center
        txt.backgroundColor = .lightGray
        return txt
    }()
    
    private let mlbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Gender"
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    private let mysegment : UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Male", at: 0, animated: true)
        segment.insertSegment(withTitle: "Female", at: 1, animated: true)
        segment.selectedSegmentIndex = 0
        segment.tintColor = .blue
        return segment
        
    }()
    
    private let addButton: UIButton = {
        let button = UIButton();
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func add()
    {
        let id=Int(Spidtxt.text!)!
        let name=nametxt.text!
        let add=addtxt.text!
        let cls=classtxt.text!
        let pwd = nametxt.text!
        let gender = mysegment.titleForSegment(at: mysegment.selectedSegmentIndex)!
        
        if let s = stud{
            CoreDataHandler.shared.update(s:s, spid: id, name: name, address: add, cls: cls, gender: gender, pwd: pwd)
            {
                print("Update")
            }
        }
        else
        {
           CoreDataHandler.shared.insert(spid: id, name: name, address: add, cls: cls, gender: gender, pwd: pwd)
           {
            print("Insert")
            }
        }
        
    }
    
  
    func resetFeilds()
    {
        nametxt.text = ""
        Spidtxt.text = ""
        addtxt.text = ""
        classtxt.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(Spidtxt)
        view.addSubview(nametxt)
        view.addSubview(addtxt)
        view.addSubview(classtxt)
        view.addSubview(mlbl)
        view.addSubview(mysegment)
        view.addSubview(addButton)
        
        if let s = stud {
            nametxt.text = s.name
            addtxt.text = s.address
            classtxt.text = s.cls
            Spidtxt.text = String(s.spid)
            //mysegment.selectedSegmentIndex = s.
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Spidtxt.frame = CGRect(x: 40, y: 80, width: view.width - 100, height: 40)
        nametxt.frame = CGRect(x: 40, y: Spidtxt.bottom + 10, width: view.width - 100, height: 40)
        addtxt.frame = CGRect(x: 40, y: nametxt.bottom + 10, width: view.width - 100, height: 40)
        classtxt.frame = CGRect(x: 40, y: addtxt.bottom + 10, width: view.width - 100, height: 40)
        mlbl.frame = CGRect(x: 40, y: classtxt.bottom + 10, width: 70, height: 40)
        mysegment.frame = CGRect(x: mlbl.right + 5, y: classtxt.bottom + 10, width:150, height: 40)
        addButton.frame = CGRect(x: 40, y: mysegment.bottom + 10, width: view.width - 100, height: 40)
    }
}

