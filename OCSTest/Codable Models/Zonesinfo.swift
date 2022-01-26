/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Zonesinfo : Codable {
	let duration : Int?
	let endcreditsautocompleted : Bool?
	let previouslytcin : String?
	let previouslytcout : String?
	let startcreditstcin : Int?
	let startcreditstcout : Int?
	let endcreditstcin : Int?
	let endcreditstcout : Int?

	enum CodingKeys: String, CodingKey {

		case duration = "duration"
		case endcreditsautocompleted = "endcreditsautocompleted"
		case previouslytcin = "previouslytcin"
		case previouslytcout = "previouslytcout"
		case startcreditstcin = "startcreditstcin"
		case startcreditstcout = "startcreditstcout"
		case endcreditstcin = "endcreditstcin"
		case endcreditstcout = "endcreditstcout"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		duration = try values.decodeIfPresent(Int.self, forKey: .duration)
		endcreditsautocompleted = try values.decodeIfPresent(Bool.self, forKey: .endcreditsautocompleted)
		previouslytcin = try values.decodeIfPresent(String.self, forKey: .previouslytcin)
		previouslytcout = try values.decodeIfPresent(String.self, forKey: .previouslytcout)
		startcreditstcin = try values.decodeIfPresent(Int.self, forKey: .startcreditstcin)
		startcreditstcout = try values.decodeIfPresent(Int.self, forKey: .startcreditstcout)
		endcreditstcin = try values.decodeIfPresent(Int.self, forKey: .endcreditstcin)
		endcreditstcout = try values.decodeIfPresent(Int.self, forKey: .endcreditstcout)
	}

}