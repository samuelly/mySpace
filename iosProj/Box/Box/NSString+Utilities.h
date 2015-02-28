//
//  NSString+Utilities.h
//  Box
//
//  Created by zhuqi on 14/10/14.
//  Copyright (c) 2014年 zhuqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utilities)

- (BOOL)contains:(NSString*)string;
- (NSString*)add:(NSString*)string;
- (NSDictionary*)firstAndLastName;
- (BOOL)isValidEmail;
- (BOOL)isValidMobile;
- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (BOOL)containsOnlyChineseWords;
- (NSString*)safeSubstringToIndex:(NSUInteger)index;
- (NSString*)stringByRemovingPrefix:(NSString*)prefix;
- (NSString*)stringByRemovingPrefixes:(NSArray*)prefixes;
- (BOOL)hasPrefixes:(NSArray*)prefixes;
- (BOOL)isEqualToOneOf:(NSArray*)strings;
- (NSString*)md5;
- (NSString*)telephoneWithReformat;
- (NSString*)trim;
-(NSString *)percise2String;
- (NSArray*)splitBy:(NSString*) splitString;

+ (NSString*)safeStr:(NSString*)str;
+ (BOOL)isNullOrEmpty:(NSString*)str;

@end
