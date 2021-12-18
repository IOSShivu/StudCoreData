//
//  ListNotice.swift
//  StudCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ListNotice: UIViewController {
    private var noticeArray = [Notice]();
    
    private let myTableView = UITableView()
    
    @objc func handleadd()
    {
        let s1 = AddNotice()
        navigationController?.pushViewController(s1, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NoticeList"
        view.backgroundColor = .white
        view.addSubview(myTableView);
        let additem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleadd))
        navigationItem.setRightBarButton(additem, animated: true)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
      
        myTableView.frame = CGRect(x: 0, y: 60, width: view.width, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        noticeArray = CoreDataHandler.shared.fetchNotice()
        myTableView.reloadData()
      
    }

}
extension ListNotice: UITableViewDataSource,UITableViewDelegate{
    private func setupTableView(){
        myTableView.dataSource = self
        myTableView.delegate   = self
        myTableView.register(NoticeCell.self, forCellReuseIdentifier: "NoticeList")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeList",for: indexPath) as! NoticeCell
        
        let note = noticeArray[indexPath.row]
        cell.setupCellWith(notice: note)
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let n = noticeArray[indexPath.row]
        
        CoreDataHandler.shared.deleteNotice(n: n)
        {
            self.noticeArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AddNotice()
        vc.note = noticeArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
