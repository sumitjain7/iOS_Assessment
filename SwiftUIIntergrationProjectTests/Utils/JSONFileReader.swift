//
//  JSONFileReader.swift
//  SwiftUIIntergrationProjectTests
//
//  Created by Sumit Jain  on 19/07/24.
//

import Foundation

final class JSONFileReader {
    public static func readfrom<T: AnyObject>(fixturesForType type: T,
                                       function: String = #function) -> Data? {
        let typeString = formatFunctionName(functionName: String(describing: T.self))
        let functionString = formatFunctionName(functionName: function)
        let fixturepath = getFilePathName(typeString: typeString, functionString: functionString)
        let bundle = Bundle(for: T.self)
        guard let fileUrl = bundle.url(forResource: fixturepath, withExtension: "json") else{
            return nil
        }
        do{
            let data = try Data(contentsOf: fileUrl)
            return data
        }
        catch(_){
            return nil
        }
    }

    private static func formatFunctionName(functionName: String) -> String {
        let functionName = functionName.replacingOccurrences(of: "()", with: "")
        return functionName
    }

    private static func getFilePathName(typeString: String, functionString: String) -> String {
        return "/Fixtures/\(typeString)/\(functionString)/response"
    }
}
