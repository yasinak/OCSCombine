/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Seasons : Codable {
	let menutitle : [Menutitle]?
	let subtitle : String?
	let number : Int?
	let id : String?
	let pitch : String?
	let imageurl : String?
	let isbookmarkable : Bool?
	let episodes : [Episodes]?
	let highlefticon : [String]?
	let acontents : [Acontents]?

	enum CodingKeys: String, CodingKey {

		case menutitle = "menutitle"
		case subtitle = "subtitle"
		case number = "number"
		case id = "id"
		case pitch = "pitch"
		case imageurl = "imageurl"
		case isbookmarkable = "isbookmarkable"
		case episodes = "episodes"
		case highlefticon = "highlefticon"
		case acontents = "acontents"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		menutitle = try values.decodeIfPresent([Menutitle].self, forKey: .menutitle)
		subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		pitch = try values.decodeIfPresent(String.self, forKey: .pitch)
		imageurl = try values.decodeIfPresent(String.self, forKey: .imageurl)
		isbookmarkable = try values.decodeIfPresent(Bool.self, forKey: .isbookmarkable)
		episodes = try values.decodeIfPresent([Episodes].self, forKey: .episodes)
		highlefticon = try values.decodeIfPresent([String].self, forKey: .highlefticon)
		acontents = try values.decodeIfPresent([Acontents].self, forKey: .acontents)
	}

}