#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>

%hook T1FleetLineHeaderViewController
  -(void)_t1_configureFleets {
    if(prefsEnabled) {
     return;
    }

    %orig;
  }

  -(void)_t1_updateFleetLineVisiblity {
    if(prefsEnabled) {
      return;
    }

    %orig;
  }
%end

%ctor {
    /*
     * Cephei automatically updates your preference variables as long as you set this up correctly
     * You need to set the post notification in your Root.plist to "com.hidefleetprefs/ReloadPrefs" for this to work.
     * You can learn more by reading Cephei's documentation: https://hbang.github.io/libcephei/
     */
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.hidefleetsprefs"];
  [preferences registerBool:&prefsEnabled default:YES forKey:@"HideFleets"];
}
