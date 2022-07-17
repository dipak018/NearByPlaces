
import Foundation
struct PlacePhoto : Codable {
	let id : String?
	let created_at : String?
	let prefix : String?
	let suffix : String?
	let width : Int?
	let height : Int?
	let classifications : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case created_at = "created_at"
		case prefix = "prefix"
		case suffix = "suffix"
		case width = "width"
		case height = "height"
		case classifications = "classifications"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
		suffix = try values.decodeIfPresent(String.self, forKey: .suffix)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		classifications = try values.decodeIfPresent([String].self, forKey: .classifications)
	}

}
