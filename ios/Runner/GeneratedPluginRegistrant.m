//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <android_intent/AndroidIntentPlugin.h>
#import <firebase_messaging/FirebaseMessagingPlugin.h>
#import <google_maps_flutter/GoogleMapsPlugin.h>
#import <url_launcher/UrlLauncherPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTAndroidIntentPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTAndroidIntentPlugin"]];
  [FLTFirebaseMessagingPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseMessagingPlugin"]];
  [FLTGoogleMapsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleMapsPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
}

@end
