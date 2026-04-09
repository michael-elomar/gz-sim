
LOCAL_PATH := $(call my-dir)

################################################################################
# gz sim
################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := gz-sim
LOCAL_DESCRIPTION := Robot simulation made easy.

LOCAL_LIBRARIES := \
	gz-cmake \
	gz-common \
	gz-plugin \
	gz-fuel-tools \
	gz-math \
	gz-msgs \
	gz-physics \
	gz-sensors \
	gz-utils \
	gz-transport \
	gz-gui \
	sdformat

LOCAL_CMAKE_CONFIGURE_ARGS := \
	-DBUILD_TESTING:BOOL=False \
	-DCMAKE_PREFIX_PATH=$(HOME)/Qt/6.9.3/gcc_64/lib/cmake

LOCAL_CMAKE_CONFIGURE_ENV +=\
	PKG_CONFIG_PATH=$(TARGET_OUT_STAGING)/usr/lib/pkgconfig:$(TARGET_OUT_STAGING)/usr/share/pkgconfig

# ignore some warnings
LOCAL_CXXFLAGS := \
	-Wno-deprecated-copy \
	-Wno-class-memaccess \
	-Wno-cast-function-type \
	-Wno-misleading-indentation

LOCAL_EXPORT_C_INCLUDES := $(TARGET_OUT_STAGING)/usr/include/gz/sim10/

LOCAL_EXPORT_LDLIBS := -lgz-sim

include $(BUILD_CMAKE)
