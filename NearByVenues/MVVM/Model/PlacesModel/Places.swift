
import Foundation
struct Places : Codable {
	let results : [Place]?
	let context : Context?

	enum CodingKeys: String, CodingKey {

		case results = "results"
		case context = "context"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		results = try values.decodeIfPresent([Place].self, forKey: .results)
		context = try values.decodeIfPresent(Context.self, forKey: .context)
	}

}
