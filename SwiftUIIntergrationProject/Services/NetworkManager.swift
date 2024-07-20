//
//  NetworkManager.swift
//  SwiftUIIntergrationProject
//
//  Created by Sumit Jain  on 19/07/24.
//

import Foundation

struct NetworkManager: NetworkManagerProtocol {
    func executeRequest<T: Decodable>(url: URL) async throws -> T {
        let session = URLSession(configuration: .default)
        let (data, response) = try await session.data(from: url)
        guard let resp = response as? HTTPURLResponse,
              (200...299).contains(resp.statusCode) else {
            throw SimpleError.dataLoad("Invalid Response")
        }

        do {
            let dec = try JSONDecoder().decode(T.self, from: data)
            return dec
        } catch {
            throw SimpleError.dataParse(error.localizedDescription)
        }

    }
}
