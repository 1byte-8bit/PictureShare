//
//  DateExtensions.swift
//  PictureShare
//
//  Created by Alexandr on 28.12.2023.
//

import Foundation

var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    
    return formatter
}()
