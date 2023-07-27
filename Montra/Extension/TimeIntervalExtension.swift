//
//  TimeIntervalExtension.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 27/07/23.
//

import Foundation

extension TimeInterval {
    var timeString: String {
        let ti = Int(self)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = ti / 3600
        
        if hours != 0 {
            return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
        }
        else {
            return String(format: "%0.2d:%0.2d", minutes, seconds)
        }
    }
}
