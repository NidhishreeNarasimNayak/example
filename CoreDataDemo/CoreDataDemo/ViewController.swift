//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Nidhishree on 14/09/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let persistenceManager: PersistanceManager
    
    init(persistenceManager: PersistanceManager) {
      self.persistenceManager = persistenceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       createUser()
        getUsers()
    }
    //create coredata object
    func createUser() {
        let user = User(context: persistenceManager.context)
        user.name = "Andrew"
        persistenceManager.save()
    }
    
    func getUsers() {
        guard  let users = try! persistenceManager.context.fetch(User.fetchRequest()) as? [User]
            else  { return }
        users.forEach({ print($0.name)})
        
    }
    
}

