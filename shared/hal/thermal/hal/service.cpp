/*
 * Copyright (C) 2023 Linaro Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define LOG_TAG "android.hardware.thermal@2.0-service.linaro-generic"

#include <android-base/logging.h>
#include <hidl/HidlTransportSupport.h>
#include "Thermal.h"

using ::android::OK;
using ::android::status_t;

// libhwbinder:
using ::android::hardware::setupTransportPolling;
using ::android::hardware::handleTransportPoll;

// libutils:
using ::android::Looper;

// Generated HIDL files:
using ::android::hardware::thermal::V2_0::IThermal;
using ::android::hardware::thermal::V2_0::implementation::Thermal;

/*
 * TODO : more accurate exit values
 */
typedef enum {
	THERMAL_HAL_OK,
	THERMAL_HAL_INTERNAL_ERROR,
} thermal_hal_error_t;

static int shutdown(thermal_hal_error_t exit_code)
{
	LOG(ERROR) << "Thermal Service is shutting down";
	exit(exit_code);
}

static int transportCallback(int fd, __attribute__((unused)) int event,
			     __attribute__((unused)) void *data)
{
	handleTransportPoll(fd);
	return 1;
}

static bool setupTransportCallback(Looper *looper)
{
	int fd;

	fd = setupTransportPolling();
	if (fd < 0)
		return false;

	if (!looper->addFd(fd, 0, Looper::EVENT_INPUT, transportCallback, NULL))
		return false;

	return true;
}

int main(int /* argc */, char** /* argv */)
{

	status_t status;
	Thermal *service;
	Looper *looper;

	LOG(DEBUG) << "Thermal HAL Service generic 2.0 starting...";

	looper = new Looper(false);
	if (looper == nullptr) {
		LOG(ERROR) << "Failed to create looper object";
		return shutdown(THERMAL_HAL_INTERNAL_ERROR);
	}

	try {
		service = new Thermal(looper);
		if (service == nullptr) {
			LOG(ERROR) << "Error creating an instance of ThermalHAL.  Exiting...";
			return shutdown(THERMAL_HAL_INTERNAL_ERROR);
		}
	}

	catch(std::string error) {
		LOG(ERROR) << "Exception when creating Thermal object error: " << error;
		return shutdown(THERMAL_HAL_INTERNAL_ERROR);
	}

	//
	// No threads for the transport layer. They are not needed for
	// our purpose.  Furthermore, adding threads will lead us to
	// the locking hell and an unexpected behavior with the
	// netlink thermal protocol.
	//
	if (!setupTransportCallback(looper)) {
		LOG(ERROR) << "Failed to setup transport callback";
		return shutdown(THERMAL_HAL_INTERNAL_ERROR);
	}

	status = service->registerAsService("default");
	if (status != OK) {
		LOG(ERROR) << "Could not register service for ThermalHAL (" << status << ")";
		return shutdown(THERMAL_HAL_INTERNAL_ERROR);
	}

	LOG(INFO) << "Thermal Service started successfully.";

	looper->pollAll(-1);

	return shutdown(THERMAL_HAL_OK);
}
