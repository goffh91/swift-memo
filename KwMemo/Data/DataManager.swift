//
//  DataManager.swift
//  KwMemo
//
//  Created by KyunWu on 2020/12/17.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    private init() {
        // Singleton
    }
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var memoList = [Memo]()
    
    func fetchMemo() {
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        let sortByDateDesc = NSSortDescriptor(key: "created_at", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        do {
            memoList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func addMemo(_ memo: String?) {
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.created_at = Date()
        
        memoList.insert(newMemo, at: 0)
        
        saveContext()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "KwMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
