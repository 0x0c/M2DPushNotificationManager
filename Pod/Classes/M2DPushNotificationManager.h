//
//  M2DPushNotificationManager.h
//  BoostMedia
//
//  Created by Akira Matsuda on 2013/01/13.
//  Copyright (c) 2013年 akira.matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol M2DPushNotificationManagerDelegate <NSObject>

@optional
- (void)didFinishRegisteringForRemoteNotificationsWithDeviceToken;

@end

@interface M2DPushNotificationManager : NSObject

@property (assign, nonatomic)id<M2DPushNotificationManagerDelegate> delegate;
@property (nonatomic, copy) void (^sendToProviderBlock)(NSString *token);

+ (id)sharedInstance;
+ (id)sharedInstanceWithDelegate:(id)delegate;
- (void)registerDeviceToken:(void (^)(NSString *token))sendToProviderBlock;
- (void)registerDeviceTokenWithRemoteNotificationTypes:(UIRemoteNotificationType)types sendToProviderBlocks:(void (^)(NSString *token))sendToProviderBlock;
- (void)processDeviceToken:(NSData *)deviceToken;
- (BOOL)pushNotificationEnabled;

@end
