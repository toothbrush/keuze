//
//  Sorter.swift
//  kies
//
//  Created by Thomas Billiet on 11/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class DataSource: NSObject, NSTableViewDataSource {
    var items = [String]()
    var sortedItems = [String]()
    var matches = [String: String]()
    var scores = [String: Float]()
    
    func updateItems(_ items: [String]) {
        self.items = items
        self.sortedItems = items
    }
    
    func updateSort(query: String) {
        if query.isEmpty {
            sortedItems = items
            return
        }

        sortedItems = items.filter({ itm in
            itm.lowercased().contains(query.lowercased())
        })
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sortedItems.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return sortedItems[row]
    }
    
}
