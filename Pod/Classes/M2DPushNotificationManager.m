//
//  M2DPushNotificationManager.m
//  BoostMedia
//
//  Created by Akira Matsuda on 2013/01/13.
//  Copyright (c) 2013年 akira.matsuda. All rights reserved.
//

#import "M2DPushNotificationManager.h"
#import <UIKit/UIKit.h>

@interface NSData (M2DPushNotificationManagerHexadecimalDescription)

- (NSString *)m2d_hexadecimalDescription;

@end

@implementation NSData (M2DPushNotificationManagerHexadecimalDescription)

- (NSString *)m2d_hexadecimalDescription
{
	NSMutableString *string = [NSMutableString stringWithCapacity:[self length] * 2];
	const uint8_t *bytes = [self bytes];
	for (int i = 0; i < [self length]; i++) {
		[string appendFormat:@"%02x", (uint32_t)bytes[i]];
	}
	
	return [NSString stringWithString:string];
}

@end

@implementation M2DPushNotificationManager

static M2DPushNotificationManager *sharedInstance_;

+ (M2DPushNotificationManager *)sharedInstance
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance_ = [[M2DPushNotificationManager alloc] init];
	});
	
	return sharedInstance_;
}

+ (M2DPushNotificationManager *)sharedInstanceWithDelegate:(id)delegate
{
	M2DPushNotificationManager *sharedInstance = [M2DPushNotificationManager sharedInstance];
	sharedInstance.delegate = delegate;
	
	return sharedInstance_;
}

#pragma mark -

- (void)registerDeviceToken:(void (^)(NSString *token))sendToProviderBlock
{
	[[UIApplication sharedApplication] registerForRemoteNotifications];
	sendToProviderBlock_ = [sendToProviderBlock copy];
}

- (void)registerDeviceTokenWithRemoteNotificationTypes:(UIRemoteNotificationType)types sendToProviderBlocks:(void (^)(NSString *token))sendToProviderBlock
{
	if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1) {
		[[UIApplication sharedApplication] registerForRemoteNotifications];
	}
	else {
		[[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
	}
	
	sendToProviderBlock_ = [sendToProviderBlock copy];
}

- (void)processDeviceToken:(NSData *)deviceToken
{
	sendToProviderBlock_([deviceToken m2d_hexadecimalDescription]);
	
	if ([self.delegate respondsToSelector:@selector(didFinishRegisteringForRemoteNotificationsWithDeviceToken)]) {
		[self.delegate didFinishRegisteringForRemoteNotificationsWithDeviceToken];
	}
}

@end
