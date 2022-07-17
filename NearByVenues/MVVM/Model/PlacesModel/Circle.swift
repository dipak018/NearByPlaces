
import Foundation
struct Circle : Codable {
	let center : Center?
	let radius : Int?

	enum CodingKeys: String, CodingKey {

		case center = "center"
		case radius = "radius"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		center = try values.decodeIfPresent(Center.self, forKey: .center)
		radius = try values.decodeIfPresent(Int.self, forKey: .radius)
	}

}
