TARGET := iphone:clang:12.2
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HideFleets

HideFleets_FILES = Tweak.xm
HideFleets_CFLAGS = -fobjc-arc
HideFleets_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += hidefleetsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
