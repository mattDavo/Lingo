//
//  Lingo.swift
//  Auto-generated by Lingo
//  Matthew Davidson 2019
//

public struct Lingo {
    
    public struct Localized {
        
        static var tableName = "Localized"
        
        public static var Welcome: String {
            return "Welcome".localized(tableName: Lingo.Localized.tableName)
        }
        public static var helloWorld: String {
            return "helloWorld".localized(tableName: Lingo.Localized.tableName)
        }
    }
}