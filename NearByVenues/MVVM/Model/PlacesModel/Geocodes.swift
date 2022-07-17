
import Foundation
struct Geocodes : Codable {
	let main : Main?
	let roof : Roof?

	enum CodingKeys: String, CodingKey {

		case main = "main"
		case roof = "roof"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		main = try values.decodeIfPresent(Main.self, forKey: .main)
		roof = try values.decodeIfPresent(Roof.self, forKey: .roof)
	}

}
