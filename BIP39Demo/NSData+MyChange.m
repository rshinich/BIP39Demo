//
//  NSData+MyChange.m
//  BIP39Demo
//
//  Created by 张忠瑞 on 2018/7/5.
//  Copyright © 2018年 张忠瑞. All rights reserved.
//

#import "NSData+MyChange.h"

@implementation NSData (MyChange)

//将字符串转换为16进制
- (NSString *)my_hexString
{
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    
    //如果buffer不存在
    if(!dataBuffer)
    {
        return [NSString string];
    }
    
    NSUInteger dataLength = [self length];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for(int i = 0 ; i < dataLength ; ++i)
    {
        [hexString appendString:[NSString stringWithFormat:@"%02lx",(unsigned long)dataBuffer[i]]];
    }
    
    return [NSString stringWithString:hexString];
}

//16进制转换为比特数组
- (NSArray *)my_hexToBitArray
{
    NSMutableArray *bitArray = [NSMutableArray arrayWithCapacity:(int)self.length * 8];
    NSString *hexStr = [self my_hexString];
    
    for(NSUInteger i = 0 ; i < [hexStr length] ; i++)
    {
        NSString *bin = [self my_hexToBinary:[hexStr characterAtIndex:i]];
        
        for(NSUInteger j = 0 ; j < bin.length ; j++)
        {
            [bitArray addObject:@([[NSString stringWithFormat:@"%C",[bin characterAtIndex:j]] intValue])];
        }
    }
    
    return [NSArray arrayWithArray:bitArray];
}

- (NSString *)my_hexToBinary:(unichar)value
{
    switch (value)
    {
        case '0': return @"0000";
        case '1': return @"0001";
        case '2': return @"0010";
        case '3': return @"0011";
        case '4': return @"0100";
        case '5': return @"0101";
        case '6': return @"0110";
        case '7': return @"0111";
        case '8': return @"1000";
        case '9': return @"1001";
        case 'a':
        case 'A':
            return @"1010";
        case 'b':
        case 'B':
            return @"1011";
        case 'c':
        case 'C':
            return @"1100";
        case 'd':
        case 'D':
            return @"1101";
        case 'e':
        case 'E':
            return @"1110";
        case 'f':
        case 'F':
            return @"1111";
    }
    return @"-1";
}

@end
