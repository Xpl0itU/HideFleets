TARGET := iphone:clang:11.2
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HideFleetsPrefs

HideFleetsPrefs_FILES = UHCRootListController.m
HideFleetsPrefs_FRAMEWORKS = UIKit
HideFleetsPrefs_PRIVATE_FRAMEWORKS = Preferences
HideFleetsPrefs_EXTRA_FRAMEWORKS += CepheiPrefs
HideFleetsPrefs_INSTALL_PATH = /Library/PreferenceBundles
HideFleetsPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
