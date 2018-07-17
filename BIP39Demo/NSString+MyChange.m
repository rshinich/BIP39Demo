//
//  NSString+MyChange.m
//  BIP39Demo
//
//  Created by 张忠瑞 on 2018/7/5.
//  Copyright © 2018年 张忠瑞. All rights reserved.
//

#import "NSString+MyChange.h"

@implementation NSString (MyChange)

//将16进制字符串转换为NSData
- (NSData *)my_dataFromHexString
{
    const char *chars = [self UTF8String];
    int i = 0, len = (int)self.length;
    
    NSMutableData *data = [NSMutableData dataWithCapacity:len/2.0];
    char byteChars[3] = {'\0','\0','\0'};
    unsigned long wholeByte;
    
    while (i < len)
    {
        byteChars[0] = chars[i++];
        byteChars[1] = chars[i++];
        wholeByte = strtoul(byteChars, NULL, 16);
        [data appendBytes:&wholeByte length:1];
    }
    
    return data;
}

@end
