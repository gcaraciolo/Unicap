//
//  GCUtils.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCUtils.h"


@implementation GCUtils

+ (BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, string.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:string options:NSMatchingReportProgress range:textRange];
    
    BOOL didValidate = NO;
    
    // Did we find a matching range
    if (matchRange.location != NSNotFound)
        didValidate = YES;
    
    return didValidate;
}

/*
 * @document a html page
 * @tag a html tag
 * @index the index of the tag
 *
 *
 * return a HTMLElement from passed tag
 */


+ (HTMLElement *)findElementFromDocument:(HTMLDocument *)document
                                 WithTag:(NSString *)tag
                                 atIndex:(int)index {
    
    HTMLSelector *selector = [HTMLSelector selectorForString:tag];
    
    int count = 0;
    for (HTMLElement *node in document.treeEnumerator) {
        
        if ([node isKindOfClass:[HTMLElement class]] &&
            [selector matchesElement:node]) {
            
            if (count == index) {
                return node;
            }
            NSLog(@"%@, use this node -> %d", node, count);
            count++;
        }
        
    }
    return nil;
}

/*
 * @array big array
 * @numberOfColumns number of columns in each row
 * 
 * return a table (matrix) base on passed array and its row size
 *
 */

+ (NSArray *)createTableFromArray:(NSArray *)array numberOfColumns:(int)numberOfColumns {
    
    NSMutableArray *table = [NSMutableArray new];
    NSMutableArray *row = [NSMutableArray new];
    
    int count = 0;
    for (id obj in array) {
        if (count == numberOfColumns) {
            [table addObject:row];
            count = 0;
            row = [NSMutableArray new];
        }
        [row addObject:obj];
        count++;
    }
    
    [table addObject:row];
    return [table copy];
}

/*
 * @element and HTMLElement
 *
 * return a string with just the elemenent content. (remove white spaces)
 *
 */

+ (NSString *)contentValueFromHTMLElement:(HTMLElement *)element {
    NSString *string = element.textContent;
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
    
}






@end
