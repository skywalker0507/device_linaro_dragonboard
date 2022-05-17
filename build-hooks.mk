HELPER_SCRIPT=./device/linaro/dragonboard/build-hooks.sh
BUILD_UPSTREAM_MESA := $(shell $(HELPER_SCRIPT) mesa)
MERGE_BUILD_UPSTREAM_DRM_HWCOMPOSER := $(shell $(HELPER_SCRIPT) drm_hwcomposer)
