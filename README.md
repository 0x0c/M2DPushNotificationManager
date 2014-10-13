# M2DPushNotificationManager

[![CI Status](http://img.shields.io/travis/Akira Matsuda/M2DPushNotificationManager.svg?style=flat)](https://travis-ci.org/Akira Matsuda/M2DPushNotificationManager)
[![Version](https://img.shields.io/cocoapods/v/M2DPushNotificationManager.svg?style=flat)](http://cocoadocs.org/docsets/M2DPushNotificationManager)
[![License](https://img.shields.io/cocoapods/l/M2DPushNotificationManager.svg?style=flat)](http://cocoadocs.org/docsets/M2DPushNotificationManager)
[![Platform](https://img.shields.io/cocoapods/p/M2DPushNotificationManager.svg?style=flat)](http://cocoadocs.org/docsets/M2DPushNotificationManager)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

First, request device token to APNS.

	[[M2DPushNotificationManager sharedInstanceWithDelegate:self] registerDeviceTokenWithRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound) sendToProviderBlocks:^(NSString *token) {
		//send device token to your server.
	}];

Second, decode device token

	- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
		[[M2DPushNotificationManager sharedInstance] processDeviceToken:deviceToken];
	}

All done.

## Requirements

## Installation

M2DPushNotificationManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "M2DPushNotificationManager"

## Author

Akira Matsuda, akira.m.itachi@gmail.com

## License

M2DPushNotificationManager is available under the MIT license. See the LICENSE file for more info.
