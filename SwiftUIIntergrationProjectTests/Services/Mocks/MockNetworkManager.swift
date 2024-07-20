//
//  MockNetworkManager.swift
//  SwiftUIIntergrationProjectTests
//
//  Created by Sumit Jain  on 19/07/24.
//

import Foundation
@testable import SwiftUIIntergrationProject

class MockNetworkManager: NetworkManagerProtocol {
    private var expectedJsonData: Data?

    func updateExpectedData(data: Data?) {
        self.expectedJsonData = data
    }

    func executeRequest<T: Decodable>(url: URL) async throws -> T {
        guard let json = expectedJsonData else {
            throw SimpleError.dataLoad("Invalid Response")
        }
        do{
            let decodedResponse = try JSONDecoder().decode(T.self, from: json)
            return decodedResponse
        } catch {
            throw SimpleError.dataParse(error.localizedDescription)
        }
    }
}
