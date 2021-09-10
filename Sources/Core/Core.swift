import Foundation
import CoreData

public class Core {
    public static let shared = Core()
    private init() { }
    
    var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "data")
        
        container.loadPersistentStores { _, _ in }
        return container
    }()
    
    var context: NSManagedObjectContext { container.viewContext }
    public static var context: NSManagedObjectContext {
        let context: NSManagedObjectContext = .init(concurrencyType: .privateQueueConcurrencyType)
        context.parent = Core.shared.context
        return context
    }
    
    public static func save() {
        if Core.shared.context.hasChanges {
            save(Core.shared.context)
        }
    }
    
    public static func save(_ context: NSManagedObjectContext) {
        do { try context.save()
        } catch { }
    }
}

