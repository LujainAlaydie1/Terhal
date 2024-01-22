//
//  Item.swift
//  Terhal
//
//  Created by Lujain Alaydie on 22/01/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
