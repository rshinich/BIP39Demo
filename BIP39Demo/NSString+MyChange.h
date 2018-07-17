//
//  NSString+MyChange.h
//  BIP39Demo
//
//  Created by 张忠瑞 on 2018/7/5.
//  Copyright © 2018年 张忠瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MyChange)

//将16进制字符串转换为NSData
- (NSData *)my_dataFromHexString;

@end
