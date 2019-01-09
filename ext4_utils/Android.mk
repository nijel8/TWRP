# Copyright 2010 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

ifneq ($(HOST_OS),windows)

# include $(CLEAR_VARS)
# LOCAL_SRC_FILES := \
#     make_ext4fs.c \
#     ext4_crypt.cpp \
#     ext4_crypt_init_extensions.cpp \
#     ext4fixup.c \
#     ext4_sb.c \
#     ext4_utils.c \
#     allocate.c \
#     crc16.c \
#     contents.c \
#     extent.c \
#     indirect.c \
#     sha1.c \
#     wipe.c
# LOCAL_MODULE := libext4_utils_$(TARGET_DEVICE)
# LOCAL_C_INCLUDES := \
#     $(LOCAL_PATH)/include \
#     system/core/base/include \
#     system/core/libkeyutils/include \
#     external/selinux/libselinux/include
# LOCAL_CFLAGS += \
#     -dynamic-linker-fno-strict-aliasing \
#     -Wall \
#     -Werror \
#     -Wno-unused-parameter \
#     -Wno-unused-result \
#     -Wno-unused-variable
# LOCAL_CLANG := true
# LOCAL_CLANG_FLAGS := \
#     -Wno-incompatible-pointer-types-discards-qualifiers \
#     -Wno-unused-const-variable
# LOCAL_STATIC_LIBRARIES := \
#     liblogwrap \
#     libsparse
# LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include

# include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_SRC_FILES := make_ext4fs_main.c
LOCAL_MODULE := make_ext4fs
LOCAL_C_INCLUDES := \
    include
LOCAL_STATIC_LIBRARIES := \
    libext4_utils_oreo
LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libselinux \
    libz \
    libsparse
LOCAL_CFLAGS := -DREAL_UUID
LOCAL_CLANG := true
LOCAL_LDFLAGS += -Wl,-dynamic-linker,/sbin/linker64
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin

include $(BUILD_EXECUTABLE)

endif
