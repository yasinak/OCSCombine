/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Episodes : Codable {
	let parentalrating : Int?
	let isbookmarkable : Bool?
	let isdownloadable : Bool?
	let number : Int?
	let title : [Title]?
	let duration : String?
	let availability : [Availability]?
	let menutitle : [Menutitle]?
	let menutitlefocus : [Menutitlefocus]?
	let summary : String?
	let highlefticon : [String]?
	let highrighticon : String?
	let subtitle : String?
	let subtitlefocus : String?
	let pitch : String?
	let bannerinfo : [Bannerinfo]?
	//let description : [[String]]?
	let imageurl : String?
	let fullscreenimageurl : String?
	let linearplanning : String?
	let acontents : [Acontents]?
	let playinfoid : Playinfoid?
	let playinfo : Playinfo?
	let id : String?
	let zonesinfo : Zonesinfo?

	enum CodingKeys: String, CodingKey {

		case parentalrating = "parentalrating"
		case isbookmarkable = "isbookmarkable"
		case isdownloadable = "isdownloadable"
		case number = "number"
		case title = "title"
		case duration = "duration"
		case availability = "availability"
		case menutitle = "menutitle"
		case menutitlefocus = "menutitlefocus"
		case summary = "summary"
		case highlefticon = "highlefticon"
		case highrighticon = "highrighticon"
		case subtitle = "subtitle"
		case subtitlefocus = "subtitlefocus"
		case pitch = "pitch"
		case bannerinfo = "bannerinfo"
		//case description = "description"
		case imageurl = "imageurl"
		case fullscreenimageurl = "fullscreenimageurl"
		case linearplanning = "linearplanning"
		case acontents = "acontents"
		case playinfoid = "playinfoid"
		case playinfo = "playinfo"
		case id = "id"
		case zonesinfo = "zonesinfo"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		parentalrating = try values.decodeIfPresent(Int.self, forKey: .parentalrating)
		isbookmarkable = try values.decodeIfPresent(Bool.self, forKey: .isbookmarkable)
		isdownloadable = try values.decodeIfPresent(Bool.self, forKey: .isdownloadable)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		title = try values.decodeIfPresent([Title].self, forKey: .title)
		duration = try values.decodeIfPresent(String.self, forKey: .duration)
		availability = try values.decodeIfPresent([Availability].self, forKey: .availability)
		menutitle = try values.decodeIfPresent([Menutitle].self, forKey: .menutitle)
		menutitlefocus = try values.decodeIfPresent([Menutitlefocus].self, forKey: .menutitlefocus)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		highlefticon = try values.decodeIfPresent([String].self, forKey: .highlefticon)
		highrighticon = try values.decodeIfPresent(String.self, forKey: .highrighticon)
		subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
		subtitlefocus = try values.decodeIfPresent(String.self, forKey: .subtitlefocus)
		pitch = try values.decodeIfPresent(String.self, forKey: .pitch)
		bannerinfo = try values.decodeIfPresent([Bannerinfo].self, forKey: .bannerinfo)
		//description = try values.decodeIfPresent([[String]].self, forKey: .description)
		imageurl = try values.decodeIfPresent(String.self, forKey: .imageurl)
		fullscreenimageurl = try values.decodeIfPresent(String.self, forKey: .fullscreenimageurl)
		linearplanning = try values.decodeIfPresent(String.self, forKey: .linearplanning)
		acontents = try values.decodeIfPresent([Acontents].self, forKey: .acontents)
		playinfoid = try values.decodeIfPresent(Playinfoid.self, forKey: .playinfoid)
		playinfo = try values.decodeIfPresent(Playinfo.self, forKey: .playinfo)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		zonesinfo = try values.decodeIfPresent(Zonesinfo.self, forKey: .zonesinfo)
	}

}
