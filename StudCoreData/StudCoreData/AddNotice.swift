//
//  AddNotice.swift
//  StudCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AddNotice: UIViewController {

    var note : Notice?
    private var titletxt : UITextField = {
        let txt = UITextField()
        txt.placeholder =  "Enter Title"
        txt.textAlignment = .center
        txt.backgroundColor = .lightGray
        return txt
    }()
    private var desctxt : UITextField = {
        let txt = UITextField()
        txt.placeholder =  "Enter Description"
        txt.textAlignment = .center
        txt.backgroundColor = .lightGray
        return txt
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
        
        let title=titletxt.text!
        let desc=desctxt.text!
        
        
        
        if let n = note{
            CoreDataHandler.shared.updateNotice(n: n, title: title, desc: desc)
            {
                print("Update")
            }
        }
        else
        {
            CoreDataHandler.shared.insertNotice(title: title, desc: desc)
            {
                print("Insert")
            }
        }
        
        
    }
   
    func resetFeilds()
    {
        titletxt.text = ""
        desctxt.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titletxt)
        view.addSubview(desctxt)
        view.addSubview(addButton)
        
        if let note = note{
            titletxt.text = note.title
            desctxt.text = note.desc
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titletxt.frame = CGRect(x: 40, y: 80, width: view.width - 100, height: 40)
        desctxt.frame = CGRect(x: 40, y: titletxt.bottom + 10, width: view.width - 100, height: 40)
        addButton.frame = CGRect(x: 40, y: desctxt.bottom + 10, width: view.width - 100, height: 40)
    }
}
