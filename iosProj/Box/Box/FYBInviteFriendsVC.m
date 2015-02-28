//
//  FYBInviteFriendsVC.m
//  Fybao
//
//  Created by zhuqi on 14/7/17.
//  Copyright (c) 2014年 fyb. All rights reserved.
//

#import "FYBInviteFriendsVC.h"
//#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>
#import "FYBPhoneContacts.h"
#import "FYBContactsCell.h"
#import "pinyin.h"
#import <MessageUI/MessageUI.h>
#import "NSString+Utilities.h"

typedef NS_ENUM(NSUInteger, AlertViewTag) {
    AlertViewWrongNumber  = 1,
    AlertViewNumberExisted,
    AlertviewChooseAtLeastOne,
    AlertViewSmsNotAvailable,
    AlertViewConfirmSend,
    AlertViewSendCancel,
    AlertViewSendFailure,
    AlertViewSendSuccess,
};

@interface FYBInviteFriendsVC () <UITableViewDelegate,UITableViewDataSource,MFMessageComposeViewControllerDelegate>
@property (nonatomic, strong) NSMutableDictionary *sendMessageDic;
@property (nonatomic, strong) NSMutableDictionary *contactsDic;
@property (nonatomic, strong) NSMutableDictionary *sortedContactsDic;
@property (nonatomic, strong) UILabel *infoLbl;
@end

@interface FYBInviteFriendsVC (ContactsCellDelegate) <FYBContactsCellDelegate>

@end

@implementation FYBInviteFriendsVC
{
    UITableView *inviteFriendsTableView;
    BOOL needAddingToDic;
    NSMutableArray *listIndexArr;
    NSMutableArray *sortedKeyArry;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _contactsDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys: nil];
        _sendMessageDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initInfoLbl];
    [self initTableView];
    [self getContactsList];
    inviteFriendsTableView.layer.opacity = 0.0f;
    [UIView animateWithDuration:0.5 animations:^{
        inviteFriendsTableView.layer.opacity = 1.0f;
    } completion:^(BOOL finished) {
        
    }];
    
    [self initSendMessageButton];
    self.title = kStr(@"Invite Friends");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initInfoLbl {
    _infoLbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 280, 60)];
    _infoLbl.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    _infoLbl.center = CGPointMake(self.view.frame.size.width/2, 200);
    _infoLbl.textAlignment = NSTextAlignmentCenter;
    _infoLbl.textColor = [UIColor lightGrayColor];
    _infoLbl.lineBreakMode = NSLineBreakByWordWrapping;
    _infoLbl.numberOfLines = 0;
    _infoLbl.text= @"没有联系人";
}

- (void)initTableView {
    inviteFriendsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64) style:UITableViewStylePlain];
    inviteFriendsTableView.delegate = self;
    inviteFriendsTableView.dataSource = self;
    if (IOS7) {
        inviteFriendsTableView.sectionIndexBackgroundColor = [UIColor clearColor];
    }
    inviteFriendsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:inviteFriendsTableView];
}
 
- (void)initSendMessageButton {
    UIBarButtonItem *sendMessageBtn = [[UIBarButtonItem alloc]initWithTitle:kStr(@"Send Message") style:UIBarButtonItemStyleBordered target:self action:@selector(sendMessageBtnPressed:)];
    self.navigationItem.rightBarButtonItem = sendMessageBtn;
}

- (void)sendMessageBtnPressed:(id)btn {
    //DLog(@"send btn pressed. ");
    if ([_sendMessageDic count] > 0 ) {
        [self alertWithTitle:@"提示" msg:@"确认要发送短信吗？" cancelBtnTitle:@"取消" tagIndex:AlertViewConfirmSend];
        
    } else {
        [self alertWithTitle:@"提醒" msg:@"请选择至少一个联系人" cancelBtnTitle:nil tagIndex:AlertviewChooseAtLeastOne];
    }
}

- (void)showMessageView {
    if([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *mc = [[MFMessageComposeViewController alloc] init];
        //设置委托
        mc.messageComposeDelegate = self;
        //短信内容
        mc.body = @"Hi,guys,come to join us!";
        //短信接收者，可设置多个
        mc.recipients = [NSArray arrayWithArray:[_sendMessageDic allKeys]];
        [[[[mc viewControllers] lastObject] navigationItem] setTitle:@"邀请短信"];//修改短信界面标题
        
        [self presentViewController:mc animated:YES completion:nil];
    }else{
        [self alertWithTitle:@"提醒" msg:@"设备没有短信功能" cancelBtnTitle:nil tagIndex:AlertViewSmsNotAvailable];
        [self resetViews];
    }
}

#pragma -mark -MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    switch (result) {
        case MessageComposeResultCancelled:
            [self alertWithTitle:@"提示信息" msg:@"发送取消" cancelBtnTitle:nil tagIndex:AlertViewSendCancel];
            break;
        case MessageComposeResultFailed:// send failed
            [self alertWithTitle:@"提示信息" msg:@"发送失败" cancelBtnTitle:nil tagIndex:AlertViewSendFailure];
            break;
        case MessageComposeResultSent:
            [self alertWithTitle:@"提示信息" msg:@"发送成功" cancelBtnTitle:nil tagIndex:AlertViewSendSuccess];
            break;
        default:
            break;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    [self resetViews];
    
}

- (void) alertWithTitle:(NSString *)title msg:(NSString *)msg cancelBtnTitle:(NSString *)CancelTitle tagIndex:(NSUInteger)tag{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:CancelTitle
                                          otherButtonTitles:@"确定", nil];
    [alert setTag:tag];
    [alert show];
}

#pragma -mark -响应弹出确认发送事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == AlertViewConfirmSend) {
        if (buttonIndex == 0) {  //按取消键
            [self resetViews];
            return;
        }
        
        if (buttonIndex == 1) {  //按确认键
            [self showMessageView];
        }
    }
}

- (void)resetViews {
    NSIndexPath *indexPath;
    for (indexPath in [_sendMessageDic allValues]) {
        NSUInteger row = indexPath.row;
        NSInteger section = indexPath.section;
        FYBPhoneContacts *contact = [[_contactsDic objectForKey:[sortedKeyArry objectAtIndex:section]] objectAtIndex:row];
        if (contact.isSelected) {
            contact.isSelected = NO;
        }
    }
    [_sendMessageDic removeAllObjects];
    [inviteFriendsTableView reloadData];
    [self.navigationItem.rightBarButtonItem setTitle:[NSString stringWithFormat:kStr(@"Send Message")]];
}

- (void)getContactsList {
    CFErrorRef * error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error)
    {
         if (granted)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
                 CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
                 
                 for(int i = 0; i < numberOfPeople; i++){
                     ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
                     NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
                     NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
                     //DLog(@"Name:%@ %@", firstName, lastName);
                     ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
                     
                     for (CFIndex i = 0; i < ABMultiValueGetCount(phoneNumbers); i++) {
                         [self initContactsListDic:firstName withLastName:lastName andPhoneNumber:phoneNumbers andIndex:i];
                     }
                 }
                 
                 sortedKeyArry = [self getSortedKeyArry];
                 
                 if ([[_contactsDic allKeys] count] > 0) {
                     [_infoLbl removeFromSuperview];
                     inviteFriendsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
                     [inviteFriendsTableView reloadData];
                 } else {
                     [inviteFriendsTableView addSubview:_infoLbl]; //没有联系人的情况
                 }
             });
         } else { // 不允许访问电话本的情况
             _infoLbl.text= @"要使用此功能，请去 设置－隐私－通讯录 中开启允许房源宝访问。";
             [inviteFriendsTableView addSubview:_infoLbl];
         }
     });
}

- (NSMutableArray *)getSortedKeyArry {
    NSArray *keyArry = [[NSArray alloc]initWithArray:[_contactsDic allKeys]];
    NSArray *firstSortArry = [keyArry sortedArrayUsingComparator:^(NSString *a,NSString *b){  //排序首字母
        return [a compare:b];
    }];
    
    NSMutableArray *firstSortMuArry = [[NSMutableArray alloc] initWithArray:firstSortArry];
    if (([firstSortMuArry count ] > 0) && [[firstSortMuArry objectAtIndex:0] isEqualToString:@"#"]) {
        [firstSortMuArry removeObjectAtIndex:0];
        NSUInteger index = [firstSortMuArry count];
        [firstSortMuArry insertObject:@"#" atIndex:index];
    }
    return firstSortMuArry;
}

- (void)initContactsListDic:(NSString *)firstName withLastName:(NSString *)lastName andPhoneNumber:(ABMultiValueRef)phoneNumbers andIndex:(CFIndex)i {
    FYBPhoneContacts *contacts = [[FYBPhoneContacts alloc]init];
    contacts.firstName = firstName;
    contacts.lastName = lastName;
    contacts.phoneNumber = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, i);
    //DLog(@"phone:%@", contacts.phoneNumber);
    
    char lastNameChr = pinyinFirstLetter([lastName characterAtIndex:0]); //获得中文姓氏对应首字母
    char firstNameChr = pinyinFirstLetter([firstName characterAtIndex:0]); //处理把姓名写在名字那栏上的情况
    NSString *pinyinOfLastName;
    if ((lastNameChr >= 'A' && lastNameChr <= 'Z') || (lastNameChr >= 'a' && lastNameChr <= 'z')) {
        pinyinOfLastName =[[NSString stringWithFormat:@"%c",lastNameChr]uppercaseString];
    } else if (([lastName length] == 0 && [firstName length] != 0) && ((firstNameChr >= 'A' && firstNameChr <= 'Z') || (firstNameChr >= 'a' && firstNameChr <= 'z'))) {
        pinyinOfLastName =[[NSString stringWithFormat:@"%c",firstNameChr]uppercaseString];
    } else {
        pinyinOfLastName =[NSString stringWithFormat:@"%c",'#'];
    }
    
    NSArray *contactsKeyArry = [_contactsDic allKeys];
    
    needAddingToDic = YES;
    for (NSInteger index = 0; index < [contactsKeyArry count]; index++) {
        if ([pinyinOfLastName isEqualToString:[contactsKeyArry objectAtIndex:index]]) { // 查找是否已存在此对应首字母
            [[[_contactsDic allValues] objectAtIndex:index] addObject:contacts]; // 把此联系人加入到对应的首字母的数组中
            needAddingToDic = NO;
            break;
        }
    }
    if (needAddingToDic == YES) {
        NSMutableArray *contactsArry = [[NSMutableArray alloc] init];
        [contactsArry addObject:contacts];
        [_contactsDic setObject:contactsArry forKey:pinyinOfLastName];
    }
}

#pragma -mark -UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sortedKeyArry count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

#pragma -mark -UITableViewDataSource
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [sortedKeyArry objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_contactsDic objectForKey:[sortedKeyArry objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell_contacts";
    FYBContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FYBContactsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    FYBPhoneContacts *contact = [[_contactsDic objectForKey:[sortedKeyArry objectAtIndex:section]] objectAtIndex:row];
    [cell showWithData:(NSObject *)contact];
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView { // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    return sortedKeyArry;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSInteger count = 0;
    //DLog(@"%@-%d",title,index);
    
    for (NSString *character in sortedKeyArry) {
        if ([character isEqualToString:title]) {
            return count;
        }
        count ++;
    }
    return 0;
}

@end

@implementation FYBInviteFriendsVC (ContactsCellDelegate)

- (void)checkStatusChanged:(FYBContactsCell *)cell andButton:(UIButton *)btn {
    NSIndexPath *indexPath = [inviteFriendsTableView indexPathForCell:cell];
    NSUInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    FYBPhoneContacts *contact = [[_contactsDic objectForKey:[sortedKeyArry objectAtIndex:section]] objectAtIndex:row];
    //contact.isSelected = btn.isSelected==YES;
    
    NSString *prefixStr = @"+86"; //如果有前缀+86的情况
    NSString *phoneNumber;
    if ([[contact.phoneNumber substringWithRange:NSMakeRange(0, 3)] isEqualToString:prefixStr]) {
        phoneNumber = [contact.phoneNumber substringFromIndex:3];
    } else {
        phoneNumber = contact.phoneNumber;
    }
    //转化为纯号码数字
    NSString *forSendNumber = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]]componentsJoinedByString:@""];
    
    
    if (![forSendNumber isEqualToString:@"10086"] && (!btn.isSelected && ![forSendNumber isValidMobile])) { //如果为非法号码
        [self alertWithTitle:@"提醒" msg:@"您选择的号码格式不正确" cancelBtnTitle:nil tagIndex:AlertViewWrongNumber];
        contact.isSelected = NO;
        return;
    }
    
    if (!btn.isSelected) {
        for (NSString *phoneNumber in [_sendMessageDic allKeys]) {
            if ([phoneNumber isEqualToString:forSendNumber]) {
                [self alertWithTitle:@"提醒" msg:@"您选择的号码已在发送名单中，请不要重复选择" cancelBtnTitle:nil tagIndex:AlertViewNumberExisted];
                return;
            }
        }
        [_sendMessageDic setObject:indexPath forKey:forSendNumber];
    } else {
        [_sendMessageDic removeObjectForKey:forSendNumber];
    }
    
    btn.selected = !btn.selected;
    contact.isSelected = btn.selected;
    
    if (_sendMessageDic.count > 0) {
        [self.navigationItem.rightBarButtonItem setTitle:[NSString stringWithFormat:@"%@(%d)",kStr(@"Send Message"),_sendMessageDic.count]];
    } else {
        [self.navigationItem.rightBarButtonItem setTitle:[NSString stringWithFormat:kStr(@"Send Message")]];
    }
}
@end
