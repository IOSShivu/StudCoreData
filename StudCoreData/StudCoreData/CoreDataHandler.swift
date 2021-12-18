//
//  CoreDataHandler.swift
//  StudCoreData
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHandler{
    static let shared = CoreDataHandler()
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let manageObjectContext:NSManagedObjectContext?
    
    private init()
    {
        manageObjectContext = appdelegate.persistentContainer.viewContext
    }
    func save()
    {
        appdelegate.saveContext()
    }
    func insert(spid:Int,name:String,address:String,cls:String,gender:String,pwd:String,completion: @escaping()->Void)
    {
        let s=Stud(context: manageObjectContext!)
        s.spid=Int64(spid)
        s.name=name
        s.address=address
        s.cls=cls
        s.password=pwd
        s.gender=gender
        save()
        completion()
    }
    func fetch()->[Stud]
    {
        let fetchreq:NSFetchRequest<Stud>=Stud.fetchRequest()
        do{
            let sarray = try manageObjectContext?.fetch(fetchreq)
            return sarray!
        }
        catch{
            print("Error")
            return [Stud]()
        }
    }
    func update(s:Stud,spid:Int,name:String,address:String,cls:String,gender:String,pwd:String,completion: @escaping()->Void)
    {
        
        s.spid=Int64(spid)
        s.name=name
        s.address=address
        s.cls=cls
        s.password=pwd
        s.gender=gender
        save()
        completion()
    }
    func delete(s:Stud,completion: @escaping()->Void)
    {
        
       manageObjectContext!.delete(s)
        save()
        completion()
    }
    func insertNotice(title:String,desc:String,completion: @escaping()->Void)
    {
        let n=Notice(context: manageObjectContext!)
        n.title=title
        n.desc=desc
        save()
        completion()
    }
    func fetchNotice()->[Notice]
    {
        let fetchreq:NSFetchRequest<Notice>=Notice.fetchRequest()
        do{
            let narray = try manageObjectContext?.fetch(fetchreq)
            return narray!
        }
        catch{
            print("Error")
            return [Notice]()
        }
    }
    func updateNotice(n:Notice,title:String,desc:String,completion: @escaping()->Void)
    {
        
       
        n.title=title
        n.desc=desc
        save()
        completion()
    }
    func deleteNotice(n:Notice,completion: @escaping()->Void)
    {
        
        manageObjectContext!.delete(n)
        save()
        completion()
    }
    
    func searchstud(cls:String)->[Stud]
    {
        var sdata = [Stud]()
        
        
        let fetchreq:NSFetchRequest = Stud.fetchRequest()
        let cpredict = NSPredicate(format: "cls contains %@", cls)
        fetchreq.predicate = cpredict
        
        do{
            sdata = try (manageObjectContext?.fetch(fetchreq))!
            return sdata
        }
        catch{
            print("Error")
            return [Stud]()
        }
    }
    func loginstud(spid:Int)->[Stud]
    {
        var sdata = [Stud]()
        
        
        let fetchreq:NSFetchRequest = Stud.fetchRequest()
        let cpredict = NSPredicate(format: "spid contains %i", spid)
        fetchreq.predicate = cpredict
        
        do{
            sdata = try (manageObjectContext?.fetch(fetchreq))!
            print(sdata.count)
            return sdata
        }
        catch{
            print("Error")
            return [Stud]()
        }
    }
    func updatpwd(s:Stud,pwd:String,completion: @escaping()->Void)
    {
        s.password=pwd
        save()
        completion()
    }
}
