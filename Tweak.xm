#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>
#import <UIKit/UIKit.h>
#import "Tweak.h"

BOOL NoFleets;
BOOL NoPromoted;

%group Fleets
%hook T1FleetLineHeaderViewController
  -(void)_t1_configureFleets {
    if(NoFleets) {
     return;
    }
    %orig;
  }

  -(void)_t1_updateFleetLineVisiblity {
    if(NoFleets) {
      return;
    }
    %orig;
  }
%end
%end

%group Promoted
%hook TFNItemsDataViewController
  -(id)tableViewCellForItem:(id)arg1 atIndexPath:(id)arg2 {
    UITableViewCell *tbvCell = %orig;
    id item = [self itemAtIndexPath: arg2];

    if (NoPromoted && [item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
        [tbvCell setHidden: YES];
        return tbvCell;
      }
      return tbvCell;
    }

    -(double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
      id item = [self itemAtIndexPath: arg2];

      if (NoPromoted && [item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
        return 0;
      }
      return %orig;
    }
%end
%end



%ctor {
    /*
     * Cephei automatically updates your preference variables as long as you set this up correctly
     * You need to set the post notification in your Root.plist to "com.hidefleetprefs/ReloadPrefs" for this to work.
     * You can learn more by reading Cephei's documentation: https://hbang.github.io/libcephei/
     */
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.hidefleetsprefs"];
  [preferences registerBool:&NoFleets default:YES forKey:@"HideFleets"];
  [preferences registerBool:&NoPromoted default:YES forKey:@"NoPromoted"];

  %init(Fleets);
  %init(Promoted);
}
