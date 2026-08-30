#pragma once
#include "../protect/oxorany.hpp"

namespace offsets::globals {
    inline uint64_t PlayerManager = oxorany(0xAC5E190);
}

namespace offsets::player {
    inline uint64_t LocalPlayer = oxorany(0x70);
    inline uint64_t Team = oxorany(0x79);
    inline uint64_t Health = oxorany(0x28);

    inline uint64_t MovementCtrl = oxorany(0x98);
    inline uint64_t TransformData = oxorany(0xB0);
    inline uint64_t Position = oxorany(0x44);

    inline uint64_t MainCamera = oxorany(0xE8);
}

namespace offsets::list {
    inline uint64_t List = oxorany(0x28);
    inline uint64_t Count = oxorany(0x20);
    inline uint64_t Buffer = oxorany(0x18);
}

namespace offsets::camera {
    inline uint64_t Transform = oxorany(0x20);
    inline uint64_t MatrixData = oxorany(0x10);
    inline uint64_t ViewMatrix = oxorany(0xF0);
}