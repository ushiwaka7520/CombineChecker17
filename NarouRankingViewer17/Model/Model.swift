//
//  Model.swift
//  NarouRankingViewer17
//
//  Created by cmStudent on 2022/07/10.
//

import Foundation

//時間更新処理
struct Model {
    
    func getDate() -> String {
        var todayDateText = "YYYY/mm/dd HH:MM:SS"
        let today = Date()
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: today)
        todayDateText = "\(dateComponents.year!)/\(dateComponents.month!)/\(dateComponents.day!) \(dateComponents.hour!):\(dateComponents.minute!):\(dateComponents.second!)"
        return todayDateText
    }

}
