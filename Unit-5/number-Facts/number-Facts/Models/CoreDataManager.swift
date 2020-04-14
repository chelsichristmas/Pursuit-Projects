//
//  CoreDataManager.swift
//  number-Facts
//
//  Created by Chelsi Christmas on 4/9/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    // implement singleton
    static let shared = CoreDataManger()
    private init() {}

    private var  users = [User]() // User is a NSMangedObject
    
    private var posts = [Post]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // viewContext is of type NSManagedObjectContext
    
    
    //CRUD
    
    public func createUser(name: String, dob: Date) -> Date {
        let user = User(entity: User.entity(), insertInto: context)
        user.name = name
        user.dob = dob
    
    
    //========
    // save changes to the NSManagedObjectContext
    //=====
    
    //persistence - saving data
    // persistence we've used so far: user defaults, documents directory, firebase, core data, (iCloud)
    // similar to saving to the documents dictionary
    
    do {
    try context.save() // NSManagedObject
    } catch {
    print("error saving users: \(error)")
    }
    return user
}

public func fetchUser() -> [User] {
    do {
        users = try context.fetch(User.fecthRequest()) // fetchRequest gets all th eobjects from CoreData
        // Extra notes: we can use NSpredicate to sort and filter CoreData objects during fetching
    } catch {
        print("fetching users error: \(error) ")
    }
    return users
}
    

}
