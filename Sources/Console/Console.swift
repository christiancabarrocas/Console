//
//  Console.swift
//  Created by Christian Cabarrocas on 14/06/2019.
//  Basic os.log wrapper

import Foundation
import os.log

enum ConsoleErrorType: String {
    case networking
    case decoding
    case encoding
    case viewCycle
    case userInterface
    case none
    case unknown
}

@available(iOS 14.0, *)
struct Console {

    private static var subsystem = Bundle.main.bundleIdentifier!

    static func log(_ message: String = "", type: OSLogType = .info, subtype: ConsoleErrorType = .none) {
        let customLog = Logger(subsystem: subsystem, category: subtype.rawValue)
        switch type {
        case .debug: customLog.debug("\(message)")
        case .error: customLog.error("\(message)")
        case .info: customLog.info("\(message)")
        default: customLog.log("\(message)")
        }
    }
}
