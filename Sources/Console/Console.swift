//
//  Console.swift
//  Created by Christian Cabarrocas on 14/06/2019.
//  Basic os.log wrapper

import Foundation
import os.log

public enum ConsoleErrorType: String {
    case networking
    case decoding
    case encoding
    case viewCycle
    case userInterface
    case none
    case unknown
}

public enum ConsoleLogType {
    case info
    case debug
    case error
}

@available(iOS 14.0, *)
public struct Console {

    private static var subsystem = Bundle.main.bundleIdentifier!

    public static func log(_ message: String = "", type: ConsoleLogType = .info, subtype: ConsoleErrorType = .none) {
        let customLog = Logger(subsystem: subsystem, category: subtype.rawValue)
        switch type {
        case .debug: customLog.debug("\(message)")
        case .error: customLog.error("\(message)")
        case .info: customLog.info("\(message)")
        }
    }
}
