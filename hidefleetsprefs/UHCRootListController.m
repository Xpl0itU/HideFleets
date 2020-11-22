#include "UHCRootListController.h"
#include <spawn.h>

@implementation UHCRootListController


+ (NSString *)hb_specifierPlist {
	return @"Root";
}

-(void)apply {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Apply?" message:@"This will kill Twitter and apply the changes." preferredStyle:UIAlertControllerStyleAlert];

  	UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
		pid_t pid;
		const char* args[] = {"killall", "Twitter", NULL};
		posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    }];
  	UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
  	[alert addAction:cancel];
  	[alert addAction:ok];
  	[self presentViewController:alert animated:YES completion:nil];
}

@end
