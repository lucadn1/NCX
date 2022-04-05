
import Foundation


class Network {
    
    func getCountries1 () async throws -> [Country] {
        guard let url = URL(string: "https://restcountries.com/v2/all") else {
            print("error URL")
           return [Country]()
        }

        let (data,_) = try await URLSession.shared.data(from: url)

        let countries = try! JSONDecoder().decode([Country].self, from: data)

        return countries
    }
}












    
