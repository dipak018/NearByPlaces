
import Foundation
struct Location : Codable {
	let address : String?
	let country : String?
	let formatted_address : String?
	let locality : String?
	let postcode : String?
	let region : String?

	enum CodingKeys: String, CodingKey {

		case address = "address"
		case country = "country"
		case formatted_address = "formatted_address"
		case locality = "locality"
		case postcode = "postcode"
		case region = "region"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		formatted_address = try values.decodeIfPresent(String.self, forKey: .formatted_address)
		locality = try values.decodeIfPresent(String.self, forKey: .locality)
		postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
		region = try values.decodeIfPresent(String.self, forKey: .region)
	}

}
