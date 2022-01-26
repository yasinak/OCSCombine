/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Movies : Codable {
	let template : String?
	let parentalrating : Int?
	let title : String?
	let offset : Int?
	let limit : String?
	let next : String?
	let previous : String?
	let total : Int?
	let count : Int?
	let filter : String?
	let sort : String?
	let contents : [MovieContents]?

	enum CodingKeys: String, CodingKey {

		case template = "template"
		case parentalrating = "parentalrating"
		case title = "title"
		case offset = "offset"
		case limit = "limit"
		case next = "next"
		case previous = "previous"
		case total = "total"
		case count = "count"
		case filter = "filter"
		case sort = "sort"
		case contents = "contents"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		template = try values.decodeIfPresent(String.self, forKey: .template)
		parentalrating = try values.decodeIfPresent(Int.self, forKey: .parentalrating)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		offset = try values.decodeIfPresent(Int.self, forKey: .offset)
		limit = try values.decodeIfPresent(String.self, forKey: .limit)
		next = try values.decodeIfPresent(String.self, forKey: .next)
		previous = try values.decodeIfPresent(String.self, forKey: .previous)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		filter = try values.decodeIfPresent(String.self, forKey: .filter)
		sort = try values.decodeIfPresent(String.self, forKey: .sort)
		contents = try values.decodeIfPresent([MovieContents].self, forKey: .contents)
	}

}
