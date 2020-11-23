#include "UHCRootListController.h"

@implementation UHCRootListController
	-(NSArray *)specifiers {
		if (!_specifiers) {
			_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
		}

		return _specifiers;
	}

	-(void)apply {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Apply?" message:@"This will kill Twitter and apply the changes." preferredStyle:UIAlertControllerStyleAlert];

  	UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
			/*
			 * Since you're using Cephei, might as well take advantage of the respring functions it has
			 */
			[HBRespringController respring];
    }];

  	UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

  	[alert addAction:cancel];
  	[alert addAction:ok];
  	[self presentViewController:alert animated:YES completion:nil];
	}
@end
