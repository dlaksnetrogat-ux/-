# Application.mk

APP_ABI := x86_64

APP_PLATFORM := android-23

APP_STL := c++_shared

APP_CPPFLAGS := \
    -std=c++17 \
    -fno-rtti \
    -fno-exceptions \
    -fvisibility=hidden \
    -fvisibility-inlines-hidden \
    -fno-unwind-tables \
    -fno-asynchronous-unwind-tables \
    -Oz \
    

# Very aggressive size & stripping flags (be careful — sometimes breaks code)
APP_LDFLAGS := \
    -Wl,--gc-sections \
    -Wl,--strip-all \
    -Wl,--build-id=none \
    -Wl,--hash-style=gnu \
    -Wl,--no-undefined \
    -pie \
    -Wl,-z,relro \
    -Wl,-z,now \
    -Wl,-z,noexecstack

# If you want LTO also at link stage (often gives best size reduction)
