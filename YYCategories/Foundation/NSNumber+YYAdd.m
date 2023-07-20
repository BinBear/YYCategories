//
//  NSNumber+YYAdd.m
//  YYCategories <https://github.com/ibireme/YYCategories>
//
//  Created by ibireme on 13/8/24.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "NSNumber+YYAdd.h"
#import "NSString+YYAdd.h"
#import "YYCategoriesMacro.h"

YYSYNTH_DUMMY_CLASS(NSNumber_YYAdd)


@implementation NSNumber (YYAdd)

+ (NSNumber *)numberWithString:(NSString *)string {
    if (![string isKindOfClass:NSString.class] || !string.length) {
        return nil;
    }
    NSString *str = [[string stringByTrim] lowercaseString];
    static NSNumberFormatter *yy_formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        yy_formatter = [NSNumberFormatter new];
        yy_formatter.usesSignificantDigits = true;
        yy_formatter.maximumSignificantDigits = 100;
        yy_formatter.groupingSeparator = @"";
        yy_formatter.decimalSeparator = @".";
        yy_formatter.numberStyle = NSNumberFormatterNoStyle;
    });
    return [yy_formatter numberFromString:str];
}

@end
