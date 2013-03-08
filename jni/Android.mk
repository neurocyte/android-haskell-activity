LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := hw-prebuilt
LOCAL_SRC_FILES := ../obj/local/$(TARGET_ARCH_ABI)/build/libhaskell.so/libhaskell.so
include $(PREBUILT_SHARED_LIBRARY)
