#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the universal, and the SDK.  Modules must be uniquely
# named (liblights.panda), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

LOCAL_PATH := $(call my-dir)

# if some modules are built directly from this directory (not subdirectories),
# their rules should be written here.

ifeq ($(USES_DEVICE_GOOGLE_RAVIOLE),true)
  include $(call first-makefiles-under,$(LOCAL_PATH))

HBM_JNI_LIBS := libhbmsvmanager_jni.so
HBM_JNI_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT)/priv-app/HbmSVManager/lib/arm64/,$(notdir $(HBM_JNI_LIBS)))
$(HBM_JNI_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "HbmSVManager lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

DM_LIBS := libdmengine.so libdmjavaplugin.so
DM_SYMLINKS := $(addprefix $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm/,$(notdir $(DM_LIBS)))
$(DM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DMService lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib/$(notdir $@) $@

PWRSTATS_LIBS := libpowerstatshaldataprovider.so
PWRSTATS_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT)/priv-app/TurboAdapter/lib/arm64/,$(notdir $(PWRSTATS_LIBS)))
$(PWRSTATS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "powerstats lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(HBM_JNI_SYMLINKS) $(DM_SYMLINKS) $(PWRSTATS_SYMLINKS)
endif
