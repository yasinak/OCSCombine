//
//  OCSTestTests.swift
//  OCSTestTests
//
//  Created by Yasin AKINCI on 25/01/2022.
//

import XCTest
import Combine
@testable import OCSTest

class OCSTestTests: XCTestCase {

    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancellables = []
    }

    override func tearDownWithError() throws {
        
        cancellables = []
    }

    func testSearchQuery() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let moviesViewModel = MoviesViewModel()
        moviesViewModel.searchQuery = "value"
        moviesViewModel.$searchQuery.sink { value in
            print(value)
        }.store(in: &cancellables)
        
//        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testMoviesSearchModel() {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: "MoviesSearch", ofType: "json") else {
            fatalError("MoviesSearch.json not found") }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let response = try JSONDecoder().decode(Movies.self, from: data)

            XCTAssertNotNil(response.title, "Recherche")
            XCTAssertNotEqual(response.contents?.count, 0)
        } catch {
            fatalError("CurrentWeather.json file format not correct")
        }
    }

    func testMovieDetailsModel() {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: "MovieDetails", ofType: "json") else {
            fatalError("MovieDetails.json not found") }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let response = try JSONDecoder().decode(MovieDetails.self, from: data)

            XCTAssertNotNil(response.template, "detail")
            XCTAssertEqual(response.contents?.title?[0].value, "GAME CHANGE")
        } catch {
            fatalError("MovieDetails.json file format not correct")
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
