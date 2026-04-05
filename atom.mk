
LOCAL_PATH := $(call my-dir)

################################################################################
# gazebo
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
	sdformat

LOCAL_CMAKE_CONFIGURE_ARGS := \
	-DBUILD_TESTING:BOOL=False \
	-DCMAKE_PREFIX_PATH=$(HOME)/Qt6.10/6.10.0/gcc_64/lib/cmake

LOCAL_CMAKE_CONFIGURE_ENV +=\
	PKG_CONFIG_PATH=$(TARGET_OUT_STAGING)/usr/lib/pkgconfig:$(TARGET_OUT_STAGING)/usr/share/pkgconfig

# ignore some warnings
LOCAL_CXXFLAGS := \
	-Wno-deprecated-copy \
	-Wno-class-memaccess \
	-Wno-cast-function-type \
	-Wno-misleading-indentation

# LOCAL_EXPORT_C_INCLUDES := $(TARGET_OUT_STAGING)/usr/include/gazebo-11
# LOCAL_EXPORT_LDLIBS := \
# 	-lgazebo \
# 	-lgazebo_rendering \
# 	-lgazebo_physics \
# 	-lgazebo_transport \
# 	-lgazebo_sensors \
# 	-lgazebo_util \
# 	-lgazebo_msgs \
# 	-lgazebo_common \
# 	-lgazebo_client \
# 	-ltbb

include $(BUILD_CMAKE)
