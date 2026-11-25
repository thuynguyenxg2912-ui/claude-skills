---
name: bds-edit-video
description: Edit/dựng video TikTok cho kênh bất động sản "Nguyễn Thuý bđs" — điểm vào duy nhất khi người dùng nói "edit video này", "dựng video này", "làm video này cho em", gửi file .mp4 quay thô và muốn ra video hoàn chỉnh. Skill này áp chuẩn riêng của kênh BĐS (hiện giá, xưng hô, phụ đề, nhãn ảnh minh họa, pháp lý) rồi giao phần dựng cho skill edit-video-tung-dung đã cài trên máy, sau đó kiểm tra tuân thủ và viết caption.
---

# Edit video cho kênh BĐS — skill nối

Skill này **không tự dựng video**. Nó chuẩn bị yêu cầu theo chuẩn kênh, gọi skill **`edit-video-tung-dung`** để dựng, rồi lo phần sau dựng. Người dùng chỉ cần nói *"Edit video này"*.

## Bước 0 — Kiểm tra môi trường

1. **Có skill dựng chưa?** Tìm `~/.claude/skills/edit-video-tung-dung/SKILL.md`.
   - Không có, và đây là máy Mac/Windows của người dùng: hướng dẫn cài (giải nén gói `edit-video-tung-dung-ban-N.zip`, Mac bấm đúp `CAI-DAT-MAC.command`, Windows bấm đúp `CAI-DAT.bat`, xong thoát hẳn Claude Code rồi mở lại). Dừng ở đây.
   - Không có, và đây là phiên đám mây/Linux: nói rõ phiên này không có skill dựng. Nếu có công cụ kết nối máy người dùng (Remote Control), đề nghị kết nối vào thư mục video trên Mac. Nếu không, chỉ làm được Bước 1 và Bước 4 (rà nội dung, caption). Không giả vờ đã dựng.
2. **Tìm hồ sơ kênh** `kenh-profile.md`, theo thứ tự: thư mục đang làm việc → `~/claude-skills/kenh-profile.md`. Đọc toàn bộ, nhất là mục "Phong cách quay & edit hiện tại". Không thấy thì dùng chuẩn mặc định ở Bước 2 và nhắc người dùng.
3. **Xác định file video** người dùng nói tới. Nếu có nhiều file hoặc chưa rõ, hỏi 1 câu.

## Bước 1 — Hỏi tối thiểu (chỉ khi thiếu)
Chỉ hỏi những gì không suy ra được, gộp thành **một** tin nhắn:
- Video về **dự án/BĐS cụ thể** hay **kiến thức chung**?
- Nếu có **giá, diện tích, pháp lý, số căn, tiến độ**: các con số đó đã được xác minh chưa (bảng giá chính thức, văn bản pháp lý)?
- Có **ảnh phối cảnh / B-roll / quay màn hình** kèm theo không?

Người dùng nói "cứ làm đi" thì tiếp tục với mặc định, và ghi rõ chỗ nào cần xác minh khi giao.

## Bước 2 — Chuẩn kênh BĐS (báo cho skill dựng như yêu cầu trong phiên)

Skill `edit-video-tung-dung` coi yêu cầu trong phiên là **tạm thời cho video đó** (Luật số 0 của nó). Vì vậy **mỗi lần dựng** phải nêu rõ các điểm dưới đây khi gọi nó. Không sửa file SKILL.md của skill đó.

| Mục | Chuẩn kênh BĐS | Ghi chú so với mặc định của skill dựng |
|---|---|---|
| **Tiền / giá** | **ĐƯỢC hiện** giá, giá/m², số tiền booking/đặt cọc, nhưng **chỉ con số đã xác minh**. Số chưa xác minh: không hiện, đánh dấu khi giao. | **Ghi đè** luật "KHÔNG hiển thị tiền" |
| **Xưng hô trong phụ đề, chữ** | Theo hồ sơ kênh (hiện tại: "em – anh chị"). Phụ đề bám đúng lời nói, không tự đổi xưng hô trong lời. | |
| **Phụ đề** | Theo mục phong cách trong hồ sơ: chữ trắng in hoa viền đen, 1–2 dòng, tô màu **một** từ khóa mỗi câu. Kiểm tra font hiển thị đúng dấu tiếng Việt (ư, ơ, ă, ề, ỹ…). | Thay màu vàng mặc định nếu hồ sơ quy định khác |
| **Số font** | Tối đa 2 font trong một video | |
| **Ảnh phối cảnh dự án** | Luôn có chữ nhỏ "Ảnh phối cảnh minh họa" | |
| **Ảnh/video tạo bằng AI** | Hạn chế. Nếu có hình trông như thật, nhắc người dùng **bật nhãn nội dung AI** khi đăng TikTok. Không dựng cảnh giả phóng viên, logo đài truyền hình, cơ quan nhà nước | |
| **Riêng tư** | Làm mờ mặt khách, chủ nhà, người lạ; che số sổ, số CCCD, số điện thoại, địa chỉ trên giấy tờ | Dùng tính năng làm mờ mặt của skill dựng |
| **Nhạc** | Chỉ nhạc có giấy phép (thư viện nhạc thương mại của TikTok hoặc nguồn trong `TU-LAY-NHAC-SFX-LOGO.md`). Không tải nhạc thương mại | |
| **CTA cuối** | Theo hồ sơ: follow / bình luận / nhắn tin, xưng "em" | |

### Gợi ý chọn hiệu ứng cho nội dung BĐS
Đưa cho skill dựng làm gợi ý; nó vẫn tự quyết theo luật của nó:
- **Câu mở đầu** có địa danh, con số, ngày ("ĐÀ NẴNG", "3 TỶ", "1/7/2026") → chữ kẹp lớp / chữ 3D sau đầu.
- **Giá, diện tích, số căn đã xác minh** → số chạy (`CountUp`).
- **So sánh** (sổ lâu dài ↔ 50 năm, thuê ↔ mua, căn A ↔ căn B) → thẻ 3D có ✕ / ✓.
- **Quy trình pháp lý, các bước mua** → cảnh nền sáng `CardScene` đánh số bước.
- **Liệt kê "N điều cần biết"** → `FxPack stack` / `grid`.
- **Ảnh chụp giấy tờ, bảng giá, văn bản luật** → rút ảnh từ tay + bút dạ quang tô đúng dòng đang nói (đã che thông tin cá nhân).
- **Video đi xem nhà/dự án** → ít hiệu ứng che hình. Ưu tiên phụ đề, lóe trắng chuyển phòng, zoom giữ ở điểm đáng chú ý.

## Bước 3 — Gọi skill dựng
Gọi `edit-video-tung-dung` với file video và một đoạn **"Yêu cầu trong phiên cho video này"** gồm: các dòng của bảng chuẩn kênh ở trên, gợi ý hiệu ứng phù hợp, và các con số đã xác minh hay chưa. Sau đó để skill dựng làm theo quy trình của nó (lớp nền, phụ đề, hiệu ứng, cân tiếng, `check_deliver.py`).

## Bước 4 — Sau khi dựng xong
1. Lấy **bản bóc lời** (transcript) mà skill dựng đã tạo, chạy skill **`bds-kiem-tra-tuan-thu`** trên lời nói và toàn bộ chữ trên màn hình. Có mục 🔴 thì báo trước khi người dùng đăng, kèm đề xuất sửa (cắt câu, đổi chữ trên màn hình, thêm dòng "Thông tin mang tính tham khảo").
2. Chạy skill **`bds-caption-hashtag`** để ra caption, hashtag, tiêu đề ảnh bìa, bình luận ghim.
3. **Báo cáo giao bài** ngắn gọn:
   - Đường dẫn file video xuất ra
   - Hiệu ứng đã dùng ở những giây nào
   - Kết quả kiểm tra tuân thủ (✅ / ⚠️ / ⛔)
   - Con số cần xác minh, nhãn cần bật khi đăng (AI, nội dung thương mại)
   - Caption và hashtag đề xuất
