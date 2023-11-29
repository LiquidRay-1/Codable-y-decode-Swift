//Uploaded by ITE
import UIKit

let data = """
{
    "name_of_user": "EsTech",
    "age": 30
}
""".data(using: .utf8)

struct User: Codable {
    let name: String
    let age: Int
    
    enum CodingKeys: String, CodingKey{
        case name = "name_of_user"
        case age
    }
}

extension User {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
    }
}

let user = try? JSONDecoder().decode(User.self, from: data!)

print((user?.name ?? "") + " tiene \(user?.age ?? 0) años")
