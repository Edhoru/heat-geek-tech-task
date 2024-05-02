//
//  Alert.swift
//  Heat Geek Tech Task
//
//  Created by Nov Petrović on 02/05/2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Sever Error"),
                                      message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                      dismissButton: .default(Text("OK")))
    
    static let responseProblem = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please try again later or contact support."),
                                           dismissButton: .default(Text("OK")))
    
    static let decodingProblem = AlertItem(title: Text("Server Error"),
                                           message: Text("The data received from the server was invalid. Please contact support."),
                                           dismissButton: .default(Text("OK")))
}
