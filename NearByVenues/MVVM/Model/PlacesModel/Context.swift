
import Foundation
struct Context : Codable {
	let geo_bounds : Geo_bounds?

	enum CodingKeys: String, CodingKey {

		case geo_bounds = "geo_bounds"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		geo_bounds = try values.decodeIfPresent(Geo_bounds.self, forKey: .geo_bounds)
	}

}
