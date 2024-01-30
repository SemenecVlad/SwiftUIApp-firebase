//
//  PopupMenuViewModel.swift
//  ECommerceExample
//
//  Created by Vladislav on 30.01.2024.
//

import SwiftUI

enum PopupMenuViewModel: Int, CaseIterable {
    case share
    case save
    case add
    case download
    
    var imageName: String {
        switch self {
        case .share: return "paperplane.fill"
        case .save: return "bookmark.fill"
        case .add: return "plus.rectangle.fill.on.rectangle.fill"
        case .download: return "square.and.arrow.down.fill"
        }
    }
    
    var title: String {
        switch self {
        case .share: return "Share"
        case .save: return "Save"
        case .add: return "Add"
        case .download: return "Download"
        }
    }
}
