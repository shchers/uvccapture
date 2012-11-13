LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	uvccapture.c v4l2uvc.c

LOCAL_SHARED_LIBRARIES += libjpeg
LOCAL_CFLAGS += -DVERSION=\"$(grep ^VERSION Makefile | sed 's/^VERSION*.=*.\s//')\"
## Linux kernel headers
LOCAL_C_INCLUDES += bionic/libc/kernel/common
## JPEG header
LOCAL_C_INCLUDES += external/jpeg

## Module properties
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := uvccapture

include $(BUILD_EXECUTABLE)
