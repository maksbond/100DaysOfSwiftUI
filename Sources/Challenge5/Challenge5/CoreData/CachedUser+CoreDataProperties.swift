//
//  CachedUser+CoreDataProperties.swift
//  Challenge5
//
//  Created by Maksym Bondar on 10.09.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var email: String?
    @NSManaged public var company: String?
    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?

    var wrappedID: String {
        id ?? UUID().uuidString
    }

    var wrappedEmail: String {
        email ?? "unknown.email@gmail.com"
    }

    var wrappedCompany: String {
        company ?? "Unknown Company"
    }

    var wrappedName: String {
        name ?? "Unknown"
    }

    var wrappedAddress: String {
        address ?? "Unknown street"
    }

    var wrappedAbout: String {
        about ?? "Unknown about"
    }

    var wrappedRegistred: Date {
        registered ?? Date.now
    }

    var wrappedTags: [String] {
        (tags ?? "").components(separatedBy: ",")
    }

    var wrappedFriends: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []

        return set.sorted(by: { $0.wrappedID < $1.wrappedID })
    }
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
