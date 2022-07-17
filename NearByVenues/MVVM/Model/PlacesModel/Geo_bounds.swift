
import Foundation
struct Geo_bounds : Codable {
	let circle : Circle?

	enum CodingKeys: String, CodingKey {

		case circle = "circle"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		circle = try values.decodeIfPresent(Circle.self, forKey: .circle)
	}

}
