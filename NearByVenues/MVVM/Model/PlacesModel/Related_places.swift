
import Foundation
struct Related_places : Codable {
	let children : [Children]?

	enum CodingKeys: String, CodingKey {

		case children = "children"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		children = try values.decodeIfPresent([Children].self, forKey: .children)
	}

}
