#!/bin/bash

if [ "$1" = "mesa" ]; then
 # checkout and build aosp/upstream-main branch
 cd external/mesa3d && git checkout aosp/upstream-main > /dev/null
elif [ "$1" = "drm_hwcomposer" ]; then
 # checkout and build aosp/upstream-main branch
 cd external/drm_hwcomposer && git checkout aosp/upstream-main > /dev/null
fi
