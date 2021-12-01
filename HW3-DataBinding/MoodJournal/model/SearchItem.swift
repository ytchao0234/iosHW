//
//  SearchItem.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct SearchItem {
    var text = String()
    var isEditing: Bool = false
    var startDate = Date()
    var endDate = Date()
    var isPickingDate: Bool = false
}
