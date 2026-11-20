# ซอร์สโค้ดที่ต้องเปิดเผย (GPL) — LiVEport GO

LiVEport GO ใช้ซอฟต์แวร์เสรีที่แก้ไขเล็กน้อยหนึ่งตัว คือ **sing-box** (สัญญาอนุญาต GPL-3.0-or-later)
เราส่งไบนารีที่แก้แล้วไปกับเครื่อง จึงเผยแพร่ซอร์สส่วนที่แก้ให้ตามสัญญา

## ที่มาและสิ่งที่แก้
| รายการ | ค่า |
|---|---|
| โปรแกรมต้นฉบับ | sing-box https://github.com/SagerNet/sing-box (ซอร์สทางการ tag `v1.14.4`) |
| สัญญาอนุญาต | GPL-3.0-or-later |
| รุ่นที่ส่งกับเครื่อง | `1.14.4-lp1` (สั่ง `sing-box version` จะเห็น `-lp1`) |
| ส่วนที่แก้ | ไฟล์เดียว `route/network.go` เพิ่ม 6 บรรทัด: ถ้ามีตัวแปรสภาพแวดล้อม `LIVEPORT_NO_RESET` จะไม่ปิดการเชื่อมต่อทั้งหมดเมื่อเส้นทางหลักของเราเตอร์เปลี่ยน (ไม่ตั้งตัวแปร = ทำงานเหมือนต้นฉบับทุกอย่าง) |
| ไฟล์ patch | `0001-liveport-no-reset.patch` (ไฟล์เดียวกับที่ใช้ build จริง) |
| SHA-256 ของ patch | `c77af5f1564473bb205f87f22469f6f7c7a462196b3a80e4ffdd0d967acf1030` |
| SHA-256 ของไบนารี arm64 ที่ส่งกับเครื่อง | `7af4ef0770fe6bf8f15c55c0f42e07b142da63bbe5ed7b80aeb591230191fef3` (build 2026-11-17) |

## วิธี build เองให้ได้ไบนารีเดียวกัน
ต้องมี Go (ตามที่ sing-box v1.14.4 ระบุใน go.mod), curl, patch, tar
```
git clone https://github.com/anukorn-SYDEE/liveport-sing-box
cd liveport-sing-box
bash build.sh 1.14.4      # ได้ไฟล์ sing-box-1.14.4-lp1-arm64 และพิมพ์ SHA-256
```
ที่ build.sh ทำจริง (เทียบกับต้นฉบับได้เอง):
1. โหลดซอร์สทางการ `https://github.com/SagerNet/sing-box/archive/refs/tags/v1.14.4.tar.gz`
2. `patch -p1 < 0001-liveport-no-reset.patch`
3. `CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -trimpath -ldflags "-s -w -X github.com/sagernet/sing-box/constant.Version=1.14.4-lp1" ./cmd/sing-box`

ผลต่างของ SHA-256 เล็กน้อยระหว่างเครื่อง build เป็นไปได้ถ้าเวอร์ชัน Go ต่างกัน — ให้เทียบเนื้อหา patch และผลการรันแทน

## ขอซอร์ส
ลูกค้าหรือใครก็ตามที่ได้รับเครื่องขอซอร์สส่วนนี้ได้ที่ https://github.com/anukorn-SYDEE/liveport-sing-box หรือส่งอีเมลมาที่ร้าน (ที่อยู่ในใบรับประกัน) เราส่งให้ฟรี

## ซอฟต์แวร์อื่นในเครื่อง (สรุปสั้น)
- liveportd, หน้า Deck: ของ LiVEport เอง
- dnsmasq, NetworkManager, nftables, Linux, Raspberry Pi OS: แพ็กเกจ Debian/Raspberry Pi ซอร์สอยู่ที่ Debian ตามปกติ (เราไม่ได้แก้)
- Tailscale: ติดตั้งจาก repo ทางการของ Tailscale (ไม่ได้แก้)
- Speedify: ซอฟต์แวร์ของผู้ผลิต **ไม่ได้อยู่ใน image** — ลูกค้าติดตั้ง/ล็อกอินด้วยบัญชีของตัวเอง

---
## ข้อความสำหรับใส่ในคู่มือลูกค้า (วางท้ายคู่มือ / หน้าข้อตกลง)
> **ซอฟต์แวร์เสรี:** เครื่องนี้ใช้โปรแกรมเสรี sing-box ฉบับแก้ไขเล็กน้อย ตามสัญญา GPL-3.0 ดูรายละเอียดและดาวน์โหลดซอร์สที่แก้ได้ที่ **https://github.com/anukorn-SYDEE/liveport-sing-box** หรือขอจากร้านได้ฟรี
