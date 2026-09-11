ARCHS = armv7 armv7s
TARGET = iphone:clang:10.3:8.0
include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = HelloWorldDemo
HelloWorldDemo_FILES = main.m HelloWorldDemoAppDelegate.m HelloWorldDemoViewController.m
HelloWorldDemo_FRAMEWORKS = UIKit Foundation CoreGraphics
HelloWorldDemo_CFLAGS = -fobjc-arc -fno-builtin
HelloWorldDemo_USE_MODULES = 0
HelloWorldDemo_LDFLAGS = -Wl,-U,_memset

include $(THEOS_MAKE_PATH)/application.mk