ifeq ($(strip $(TARGET_USERIMAGES_USE_UBIFS)),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

include $(CLEAR_VARS)

LOCAL_CFLAGS += -O2 -Wall
LOCAL_LDLIBS += -lz -lm

LOCAL_SRC_FILES := \
	ubi-utils/src/libubi.c \
	mkfs.ubifs/mkfs.ubifs.c \
	mkfs.ubifs/crc16.c \
	mkfs.ubifs/crc32.c \
	mkfs.ubifs/lpt.c \
	mkfs.ubifs/compr.c \
	mkfs.ubifs/devtable.c \
	mkfs.ubifs/hashtable/hashtable.c \
	mkfs.ubifs/hashtable/hashtable_itr.c \
	lzo-2.03/src/lzo1x_9x.c \
	uuid/gen_uuid.c \
	uuid/unpack.c \
	uuid/pack.c \
	uuid/unparse.c



LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ubi-utils/include \
	$(LOCAL_PATH)/ubi-utils/src \
	$(LOCAL_PATH)/lzo-2.03/include \
	$(LOCAL_PATH)/uuid/

LOCAL_MODULE := mkfs_ubifs

include $(BUILD_HOST_EXECUTABLE)


#==================
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	ubi-utils/src/ubinize.c \
	ubi-utils/src/common.c \
	ubi-utils/src/crc32.c \
	ubi-utils/src/libiniparser.c \
	ubi-utils/src/dictionary.c \
	ubi-utils/src/libubigen.c 

LOCAL_C_INCLUDES+= \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ubi-utils/include \
	$(LOCAL_PATH)/ubi-utils/src

LOCAL_MODULE:=ubinize

LOCAL_CFLAGS+=-O3

include $(BUILD_HOST_EXECUTABLE)

endif
