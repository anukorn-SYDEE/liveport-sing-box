# liveport-sing-box

Source offer for the modified **sing-box** shipped in **LiVEport GO** routers (SUNYARNDEE / ร้านสัญญาณดี, Thailand).

- Upstream: https://github.com/SagerNet/sing-box — tag `v1.14.4` — GPL-3.0-or-later
- Our change: one patch, `0001-liveport-no-reset.patch` (6 lines in `route/network.go`): when the environment variable `LIVEPORT_NO_RESET` is set, sing-box does not close all connections when the router's default route changes. Without the variable it behaves exactly like upstream.
- Shipped version string: `1.14.4-lp1`
- Build: `bash build.sh 1.14.4` (downloads the official v1.14.4 source, applies the patch, builds linux/arm64)

รายละเอียดภาษาไทย (สิ่งที่แก้ วิธี build ขอซอร์ส): [GPL-SOURCE.md](GPL-SOURCE.md)

This repository contains only the patch and build script for sing-box. Other LiVEport software is not part of sing-box and is not covered here.
Contact: LINE aircard3g · 087-003-7210
