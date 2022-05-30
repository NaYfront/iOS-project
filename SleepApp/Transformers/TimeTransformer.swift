//
//  TimeTransformer.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 30.05.2022.
//

import Foundation

class TimeTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let time = value as? Time else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: time, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let time = try NSKeyedUnarchiver.unarchivedObject(ofClass: Time.self, from: data)
            return time
        } catch {
            return nil
        }
    }
}
