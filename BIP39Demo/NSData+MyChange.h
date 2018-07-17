//
//  NSData+MyChange.h
//  BIP39Demo
//
//  Created by 张忠瑞 on 2018/7/5.
//  Copyright © 2018年 张忠瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MyChange)

//将字符串转换为16进制
- (NSString *)my_hexString;

//16进制转换为比特数组
- (NSArray *)my_hexToBitArray;

@end
