
import Foundation
struct Categories : Codable {
	let id : Int?
	let name : String?
	let icon : Icon?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case icon = "icon"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		icon = try values.decodeIfPresent(Icon.self, forKey: .icon)
	}

}
