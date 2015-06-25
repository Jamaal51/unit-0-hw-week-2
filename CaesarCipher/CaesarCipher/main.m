//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

//2. Cryptography : Caesar Cipher
//
//The Roman General Julius Caesar used to correspond with his generals using a secret code. He devised a way of encrypting his messages using a simple encryption scheme now known as Caesar Cipher or Shift Cipher. You can read more about it here and watch a video here
//
//You are given a class called CaesarCipher with methods encode and decode
//Being amateur codebreakers, we want to know if two distinct looking ciphers correspond to the same input message. Write a method called codeBreaker, which accepts two cipher strings as paramaters and returns a boolean value which tells us whether they are actually the same input message encoded using two different offsets. hint: the maximum offset is 25
//There are multiple ways to do this. Try to come up with as many solutions as you can.
//Example:
//okmg = "mike", offset 2
//tprl = "mike", offset 7
//
//Both are the same input message, but different offset. Your method would return YES in this case

#import <Foundation/Foundation.h>


@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;
- (BOOL) codeBreaker:(NSString *)stringOne                  //declare method of codebreaker
                with:(NSString *)stringTwo;
- (void) printself;

@end


@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";

    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);

        result[i] = allchars[new_idx];
    }

    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

- (BOOL) codeBreaker:(NSString *)stringOne                              //method of codebreaker
                with:(NSString *)stringTwo {
    
    BOOL isSameMessage = NO;
    
    for (int i = 1; i < 26; i++){
        NSString *decodedStringOne = [self decode:stringOne offset:i];    //nested for-loop each index i it goes through 25 offsets of j
        for (int j = 1; j < 26; j++){
            NSString *decodedStringTwo = [self decode:stringTwo offset:j];
            
            if ([decodedStringOne isEqualToString:decodedStringTwo]) {    //conditional statement checks if any decode of stringOne matches stringTwo then YES, same base word
                isSameMessage = YES;
            }
        }
    }
        return isSameMessage;

}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        CaesarCipher *firstCode = [[CaesarCipher alloc] init];
        
        [firstCode encode:@"king" offset:3];
        
        NSLog(@"%@", [firstCode encode:@"king" offset:3]);
    
        BOOL isSameMessage = [firstCode codeBreaker:@"ljoh" with:@"yrpi"];
        NSLog(@"%d", isSameMessage);
        
        
//        CaesarCipher *secondCode = [[CaesarCipher alloc] init];
     
        

    }
}
