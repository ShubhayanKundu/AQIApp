//
//  BuildSettings.swift
//  AQISKProject
//
//  Created by admin on 30/10/23.
//

import Foundation
/// `BuildSettings` is a structure designed to retrieve API keys and other configuration settings from the Info.plist file of the application bundle securely.
struct BuildSettings {
    
    /// Shared instance of `BuildSettings`.
    static var shared = BuildSettings()
    
    /// A variable that contains the API key for the application.
    let api_key: String
   
    /// Private initializer for the `BuildSettings` structure.
    private init() {
        
        // Access Info.plist file in the main bundle.
        guard let infoPlistPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
              let infoPlist = NSDictionary(contentsOfFile: infoPlistPath) as? [AnyHashable: Any],
              let buildSettings = infoPlist["BuildSettings"] as? [AnyHashable: Any],
              let apiKey = buildSettings["API_Key"] as? String else {
            fatalError("Unable to retrieve API key from the Info.plist file.")
        }
        
        // Initialize `api_key` with the retrieved API key from the Info.plist file.
        api_key = apiKey
    }
}
