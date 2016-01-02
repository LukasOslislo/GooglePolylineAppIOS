//
//  GPAPolylineEncodingTests.m
//  GooglePolylineApp
//
//  Created by Lukas Oslislo on 11/12/15.
//

#import <XCTest/XCTest.h>
#import "GPAPolylineEncoding.h"

@interface GPAPolylineEncodingTests : XCTestCase

@end

@interface GPAPolylineEncoding ()

+ (float)coordinateElementFromChunk:(NSArray *)chunk;
+ (int)invertAndRightShift:(int)data8bit;

@end

@implementation GPAPolylineEncodingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLatLongArrayFromASCIIForPoint {
    NSString *encoded = @"`~oia@";
    NSArray *expected = @[@(-179.983215f)];
    
    NSArray *assumed = [GPAPolylineEncoding decodePolyline:encoded];
    
    NSNumber *assumedNumber = assumed[0];
    NSNumber *expectedNumber = expected[0];
    
    XCTAssertEqualWithAccuracy(assumedNumber.floatValue, expectedNumber.floatValue, 1e-5);
}

- (void)testLatLongArrayFromASCIIForPolyline {
    NSString *encoded = @"_p~iF~ps|U_ulLnnqC_mqNvxq`@";
    NSArray *expected = @[@(38.5), @(-120.2), @(40.7), @(-120.95), @(43.252), @(-126.453)];
    
    NSArray *assumed = [GPAPolylineEncoding decodePolyline:encoded];
    
    for (int i = 0; i < expected.count; i++) {
        NSNumber *assumedNumber = assumed[i];
        NSNumber *expectedNumber = expected[i];
        
        XCTAssertEqualWithAccuracy(assumedNumber.floatValue, expectedNumber.floatValue, 1e-5);
    }
}

- (void)testCoordinateElementFromChunk {
    NSArray *chunk = @[@(33), @(63), @(48), @(42), @(34), @(1)];
    float expected = -179.9832104;
    
    float assumed = [GPAPolylineEncoding coordinateElementFromChunk:chunk];
    
    XCTAssertEqualWithAccuracy(assumed, expected, 1e-5);
}

- (void)testInvertAndRightShift {
    int value = 0b00000010001001010100001111100001;
    int expected = 0b11111110111011010101111000001111;
    
    int assumed = [GPAPolylineEncoding invertAndRightShift:value];
    
    XCTAssert(assumed == expected);

}

@end
