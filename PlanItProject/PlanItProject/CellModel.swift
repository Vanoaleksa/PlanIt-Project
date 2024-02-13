//
//  CellModel.swift
//  PlanItProject
//
//  Created by MacBook on 2.02.24.
//

import RealmSwift
import UIKit

class Item: Object {
    
    @Persisted var id: Int
    @Persisted var title: String
    @Persisted var descriptionItem: String
    
    convenience init(id: Int, title: String, descriptionItem: String) {
        self.init()
        self.id = id
        self.title = title
        self.descriptionItem = descriptionItem
    }
}


