//
//  CoreDataHandler.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 29.05.2022.
//

import Foundation
import CoreData

enum Entities {
    static var SleepTime = "SleepTime"
    static var WakeTime = "WakeTime"
    static var SleepDurationTime = "SleepDurationTime"
}

class CoreDataHandler {
    
    // MARK: Variables
    
    private var context: NSManagedObjectContext
    
    // MARK: Initializations
    
    required init() {
        let persistentContainer: NSPersistentContainer = {
              let container = NSPersistentContainer(name: "UserHistoryData")
              container.loadPersistentStores(completionHandler: { (_, error) in
                  if let error = error as NSError? {
                      fatalError("Unresolved error \(error), \(error.userInfo)")
                  }
              })
              return container
          }()
        
        let context: NSManagedObjectContext = {
            return persistentContainer.viewContext
          }()
        
        self.context = context
    }
    
    // MARK: Functions
    
    func getContext() -> NSManagedObjectContext {
        return self.context
    }
    
    func saveContext() {
            do {
                try self.context.save()
            } catch {
                self.context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
    }
    
    func deleteObject(object: NSManagedObject) {
        context.delete(object)
        try? self.context.save()
    }
    
    func deleteAllObjects(objects: [NSManagedObject]) {
        for object in objects {
            self.context.delete(object)
        }
        try? self.context.save()
    }
    
    func getAllObjects(objectName: String) -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: objectName)
        if let objects = try? context.fetch(fetchRequest) {
            return objects
        }
        return nil
    }
    
    func getLastObject(objectName: String) -> NSManagedObject? {
        if let objects = self.getAllObjects(objectName: objectName) { return objects.last }
        return nil
    }
    
    func changeUserState() {
        if let user = self.getLastObject(objectName: "User") as? User {
            if user.state == "asleep" {
                user.state = "awake"
            } else {
                user.state = "asleep"
            }
        }
        self.saveContext()
    }
    
    func changeUserPreferableWakeTime(newWakeTime: Time) {
        if let user = self.getLastObject(objectName: "User") as? User {
            user.preferableWakeTime = newWakeTime
        }
        
        self.saveContext()
    }
    
    func changeUserPreferableSleepTime(newSleepTime: Time) {
        if let user = self.getLastObject(objectName: "User") as? User {
            user.preferableSleepTime = newSleepTime
        }
        self.saveContext()
    }
}
