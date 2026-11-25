# Công cụ Mac Vision

Hai công cụ dòng lệnh dùng framework **Vision** của Apple. **Chỉ chạy trên macOS** (Intel và Apple Silicon), macOS 12 trở lên.

| Công cụ | Mã nguồn | Làm gì | Cách gọi |
|---|---|---|---|
| `segtool` | `seg.swift` | Tách người khỏi nền: mỗi ảnh PNG đầu vào tạo ra một mặt nạ đen trắng (người = trắng), cùng kích thước | `./segtool <thư_mục_ảnh> <thư_mục_mặt_nạ>` |
| `facedet` | `facedet.swift` | Tìm khuôn mặt trong từng ảnh PNG, in toạ độ (0–1, gốc trên-trái) | `./facedet <thư_mục_ảnh>` |

Ví dụ đầu ra của `facedet`:
```
00001.png  [x 0.412-0.588 y 0.210-0.305]
00002.png none
```

## Cài lần đầu trên Mac
```bash
cd tools/mac-vision
chmod +x segtool facedet
xattr -d com.apple.quarantine segtool facedet 2>/dev/null   # nếu macOS chặn file tải về
```

Nếu file chạy sẵn bị lỗi, tự build lại từ mã nguồn (cần Xcode Command Line Tools: `xcode-select --install`):
```bash
swiftc -O seg.swift -o segtool
swiftc -O facedet.swift -o facedet
```

Quy trình dùng trong edit video: xem skill [`bds-hieu-ung-chu-sau-nguoi`](../../skills/bds-hieu-ung-chu-sau-nguoi/SKILL.md).
