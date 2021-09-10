import Foundation
import CoreData

class Core {
    static let shared = Core()
    private init() { }
    
    var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "data")
        
        container.loadPersistentStores { _, _ in }
        return container
    }()
    
    var context: NSManagedObjectContext { container.viewContext }
    static var context: NSManagedObjectContext {
        let context: NSManagedObjectContext = .init(concurrencyType: .privateQueueConcurrencyType)
        context.parent = Core.shared.context
        return context
    }
    
    static func save() {
        if Core.shared.context.hasChanges {
            do { try Core.shared.context.save()
            } catch { }
        }
    }
    
    static func save(_ context: NSManagedObjectContext) {
        do { try context.save()
        } catch { }
    }
}

