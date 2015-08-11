//
//  GCUtils.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HTMLReader.h>

@interface GCUtils : NSObject

+ (BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern;

+ (NSArray *)createTableFromArray:(NSArray *)array numberOfColumns:(int)numberOfColumns;

+ (NSString *)contentValueFromHTMLElement:(HTMLElement *)element;

+ (HTMLElement *)findElementFromDocument:(HTMLDocument *)document
                                WithTag:(NSString *)tag
                                atIndex:(int)index;

@end
