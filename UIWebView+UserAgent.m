//
//  UIWebView+UserAgent.m
//
//  Created by kazuma_ukyo on 12/04/04.
//

#import "UIWebView+UserAgent.h"

@implementation UIWebView(UserAgent)
+ (UIWebView *)webViewWithUserAgent:(NSString *)userAgent {
    NSDictionary *new = [NSDictionary dictionaryWithObject:userAgent forKey:@"UserAgent"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:new];

    UIWebView *webView = [[UIWebView alloc] init];
    return [webView autorelease];
}

+ (void)resetUserAgent
{
    NSString *userAgent = [UserAgent defaultUserAgent];
    NSString *uniqueID = nil;
    uniqueID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    userAgent = [userAgent stringByAppendingFormat:@" MobileVids and udid:[%@]", uniqueID];
    NSDictionary *def = [NSDictionary dictionaryWithObject:userAgent forKey:@"UserAgent"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:def];
}

+ (void)setUserAgent:(NSString *)uAgent {
    NSDictionary *def = [NSDictionary dictionaryWithObject:uAgent forKey:@"UserAgent"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:def];
}

@end
