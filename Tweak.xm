#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>

BOOL prefsEnabled;

static void reloadPrefs() {
  HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"com.hidefleetsprefs"];

  prefsEnabled = [[file objectForKey:@"HideFleets"] ?: @(YES) boolValue];

}

%group hide

%hook T1FleetLineHeaderViewController
-(void)_t1_configureFleets {
      return;
}

-(void)_t1_updateFleetLineVisiblity {
      return;
}
%end

%end

%ctor {
  reloadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.hidefleetsprefs/settingschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
if(prefsEnabled) {
        %init(hide);
      }
}
