//
//  CellModel.swift
//  PlanItProject
//
//  Created by MacBook on 2.02.24.
//

import RealmSwift
import UIKit

class Item: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var descriptionItem: String
    @Persisted var checked: Bool = false
}


