//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

//1. Objective-C Classes
//
//You are provided with a Person class. This class has private properties name, phoneNumber and city, along with their getter and setter methods.
//
//Write a method called checkSameCity which accepts one parameter of type Person * and checks if they live in the same city. The method should return a boolean value.
//A Person has recently had a child, whose name is 'Abc'. Write a method called registerChild which takes 0 parameters and returns a new Person * instance represeting the child, which has the same phoneNumber and city as the parent.


#import <Foundation/Foundation.h>

@interface Person: NSObject

- (void)setName:(NSString *)name; // setName is method
- (NSString *)name;

- (void)setCity:(NSString *)city;   //making a method = passing it NSString parameter to              set city property
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;

- (void)changePersonName:(Person *)aPerson       //multiple parameters
                  toName:(NSString *)newName;   // press enter lines up colons

- (BOOL) checkSameCity:(Person *)aPerson;

//- (BOOL)checkSameCity_isEqualToString:(NSObject *)Person;

- (Person *)haveChild;

@end

@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;       //instance variables
    NSString *_city;
    BOOL *_sameCity;
}

- (void)setName:(NSString *)name {    //same as interface above
    _name = name;
}

- (NSString *)name {                  //same as interface above
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;                    // _city accesses instance property. set to value of parameter
}

- (NSString *)city {                 //type of NSString, name of method is city
    return _city;                    //return value of instance variable
}

- (void)setPhoneNumber:(NSString *)phoneNumber {       // setter
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {                             //getter
    return _phoneNumber;
}


-(void)changePersonName:(Person *)aPerson
                 toName:(NSString *)newName{
    
    [aPerson setName:newName];
}


- (BOOL) checkSameCity:(Person *)aPerson{
    if ([[aPerson city] isEqualToString:[self city]]) { // self refers to this object running ie Mike checkSameCity: Carl ... self is mike
        return YES;
    } else {
        return NO;
    }
}

- (Person *)haveChild{
    Person* child = [[Person alloc] init];
    [child setCity: [self city]];
    [child setPhoneNumber: [self phoneNumber]];
    
    return child;
}


//- (BOOL)checkSameCity_isEqualToString: (NSObject *)Person {
//       return *(_sameCity);

//- (BOOL)isEqualToString:(NSString *)aString


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *first = [[Person alloc] init];
        
        [first setName:@"Victoria"];              // [ object   message to object];
        [first setCity:@"Maui"];
        [first setPhoneNumber:@"777-777-7777"];
        NSLog(@"My friend's name is %@. She lives in %@. Her phone number is %@.", first.name, first.city, first.phoneNumber);
        
        Person *second = [[Person alloc] init];
        
        [second setName:@"Olivia"];
        [second setCity:@"Maui"];
        [second setPhoneNumber:@"999-999-9999"];
        NSLog(@"My niece's name is %@. She lives in %@. Her phone number is %@.", second.name, second.city, second.phoneNumber);
        //    checkSameCity = [first.city, second.city];
        
        
        
        NSString *VictoriasName = [first name];   //asking Victoria (first) to give name
        NSLog(@"%@", VictoriasName);
        
        [first setName:@"Vicky"];
        NSLog(@"%@", [first name]);             //put in [ ]
        
        [first setCity:@"New York City"];
        NSLog(@"%@", [first city]);
        
        Person *Mike = [[Person alloc] init];
        
        [Mike changePersonName: first toName:@"Victoria"];
        NSLog(@"%@", [first name]);
        
        [Mike setCity:@"New York City"];
        
        BOOL citiesAreSame = [Mike checkSameCity: first];
        NSLog(@"%d", citiesAreSame);
        
        Person *MikesBaby = [Mike haveChild];
        NSLog(@"%@", [MikesBaby city]);
        [Mike changePersonName:MikesBaby toName:@"ABC"];
        NSLog (@"%@", [MikesBaby name]);
        
        
        
        
    }
    return 0;
}

