//
//  FYBPhoneContacts.m
//  Fybao
//
//  Created by zhuqi on 14/7/18.
//  Copyright (c) 2014年 fyb. All rights reserved.
//

#import "FYBPhoneContacts.h"
//#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>

@implementation FYBPhoneContacts

- (instancetype)init
{
    self = [super init];
    if (self) {
        //[self getPhoneContacts];
    }
    return self;
}

//- (void)getPhoneContacts {
//    CFErrorRef * error = NULL;
//    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
//    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error)
//     {
//         if (granted)
//         {
//             dispatch_async(dispatch_get_main_queue(), ^{
//                 CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
//                 CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
//                 
//                 for(int i = 0; i < numberOfPeople; i++){
//                     ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
//                     
//                     NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
//                     NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
//                     NSLog(@"Name:%@ %@", firstName, lastName);
//                     
//                     ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
//                     
//                     //NSMutableArray *numbers = [NSMutableArray array];
//                     for (CFIndex i = 0; i < ABMultiValueGetCount(phoneNumbers); i++) {
//                         NSString *phoneNumber = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, i);
//                         NSLog(@"phone:%@", phoneNumber);
//                         //[numbers addObject:phoneNumber];
//                     }
//                     
//                     //                     NSMutableDictionary *contact = [NSMutableDictionary dictionary];
//                     //                     [contact setObject:lastName forKey:@"name"];
//                     //                     [contact setObject:numbers forKey:@"numbers"];
//                     
//                     //[all_contacts addObject:contact];
//                 }
//             });
//         }
//     });
//}

@end
