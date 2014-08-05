###############################################################################
# 
#                    APQ8064 PANTECH MODEL config makefile
#
###############################################################################
# 2012-03-21 choiseulkee : Created
###############################################################################
TARGET_BUILD_PROJECT=ef52l#
TARGET_BUILD_PRJ_NAME=$(shell echo $(TARGET_BUILD_PROJECT) | tr a-z A-Z)


TARGET_BUILD_MODEL_NAME=IM-A870L#
TARGET_BUILD_VER_PREFIX=S1235#
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)200#
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)201#SR-2
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)202# 14/05/22 SR-3
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)203# 14/05/29 SR-4
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)204# 14/06/09 SR-5
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)205# 14/06/13 SR-6
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)206# 14/06/18 SR-7
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)207# 14/06/23 SR-8
#TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)208# 14/06/24 SR-9
TARGET_BUILD_VERSION=$(TARGET_BUILD_VER_PREFIX)209# 14/07/08 Ver
TARGET_BUILD_VERSION_HIDDEN=$(TARGET_BUILD_VERSION)# hidden version
TARGET_BUILD_FS_VER=153# android userdata ext4 filesystem version
TARGET_BUILD_NV_VER=149# mdm efs version
TARGET_BUILD_CARRIER=LGT-KOR


TARGET_BUILD_BRAND=VEGA
TARGET_BUILD_BRAND_MODEL_NAME=$(TARGET_BUILD_BRAND)_$(TARGET_BUILD_MODEL_NAME)

###############################################################################
# OEM_ environment variable
###############################################################################
PANTECH_STORAGE_USE_TYPE=PANTECH_STORAGE_INTERNAL_EMUL

PANTECH_GLOBAL_FLAGS= -DPROJECT_NAME=\"$(TARGET_BUILD_PROJECT)\"
PANTECH_GLOBAL_FLAGS+= -DMODEL_NAME=\"$(TARGET_BUILD_MODEL_NAME)\"
PANTECH_GLOBAL_FLAGS+= -DPANTECH_BUILD_VER=\"$(TARGET_BUILD_VERSION)\"
PANTECH_GLOBAL_FLAGS+= -DPANTECH_FS_VER=$(TARGET_BUILD_FS_VER)
PANTECH_GLOBAL_FLAGS+= -DPANTECH_EFS_VER=$(TARGET_BUILD_NV_VER)
PANTECH_GLOBAL_FLAGS+= -DPANTECH_PRELOAD_CHECKSUM=$(TARGET_PRELOAD_CHECKSUM)
#PANTECH_GLOBAL_FLAGS+= -DPANTECH_BUILD_CARRIER=$(TARGET_BUILD_CARRIER)

PANTECH_KERNEL_FLAGS:=$(PANTECH_GLOBAL_FLAGS)

PANTECH_GLOBAL_FLAGS+= -DT_$(TARGET_BUILD_PRJ_NAME)

PANTECH_GLOBAL_FLAGS+= -DT_BUILD_USER


# PANTECH_SECBOOT
ifeq ($(CMD_V_SECURE_BOOT),enable)
PANTECH_GLOBAL_FLAGS+= -DFEATURE_PANTECH_SEC_BUILD
endif

PANTECH_GLOBAL_FLAGS+= -I$(PANTECH_BUILD_SYSTEM)
PANTECH_SCONS_FLAGS := '$(PANTECH_GLOBAL_FLAGS) --preinclude=$(PANTECH_BUILD_SYSTEM)/cust_pantech.h'
PANTECH_GLOBAL_FLAGS+=  -include $(PANTECH_BUILD_SYSTEM)/cust_pantech.h
PANTECH_SCONS_HEXAGON_FLAGS := '$(PANTECH_GLOBAL_FLAGS)'


PANTECH_SCONS_NO_DEBUG = PANTECH_NO_DEBUG=yes#


#FEATURE_SKY_SDCARD_UPGRADE
PANTECH_GLOBAL_FLAGS+= -DGOTA_UPDATE_FILE_TIMESTAMP=$(START_TIME)