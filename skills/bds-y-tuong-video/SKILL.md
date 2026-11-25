---
name: bds-y-tuong-video
description: Tạo ý tưởng video TikTok ngách bất động sản Việt Nam — chủ đề, góc nhìn, hook mở đầu, series nội dung. Dùng khi người dùng xin ý tưởng video, chủ đề đăng bài, "tuần này quay gì", series về nhà đất, căn hộ, đất nền, thuê nhà, vay mua nhà, pháp lý nhà đất.
---

# Ý tưởng video TikTok Bất động sản

## Trước khi bắt đầu
1. Đọc `kenh-profile.md` (tìm ở thư mục đang làm việc, rồi `~/claude-skills/kenh-profile.md`) để biết khu vực, phân khúc, khán giả, giọng điệu. Mục nào trống thì giả định hợp lý và ghi rõ giả định ở cuối câu trả lời.
2. Nếu người dùng nêu số lượng, trụ cột hoặc sự kiện cụ thể (lãi suất thay đổi, luật mới, dự án mới mở bán), ưu tiên theo đó.

## 5 trụ cột nội dung
Phân bổ ý tưởng đều giữa các trụ cột, trừ khi người dùng chỉ định:

| Trụ cột | Mục tiêu | Ví dụ góc |
|---|---|---|
| **Kiến thức / pháp lý** | Tạo uy tín, được lưu lại | "3 dòng trên sổ hồng phải đọc kỹ", "Đặt cọc thế nào để không mất tiền" |
| **Cảnh báo / sai lầm** | Lượt xem cao, chia sẻ | "5 chiêu lừa đặt cọc phổ biến", "Sai lầm khi mua căn hộ lần đầu" |
| **Thực tế / tham quan** | Gần gũi, tạo nhu cầu | "Căn 2PN 3 tỷ ở X trông thế nào", "Đi xem nhà cùng mình" |
| **Tài chính / con số** | Tranh luận, bình luận | "Lương 20 triệu mua được nhà chưa?", "Thuê hay mua: tính thật" |
| **Hậu trường / cá nhân** | Kết nối, tin tưởng | "Một ngày làm môi giới", "Khách khó nhất mình từng gặp" |

## Công thức hook (3 giây đầu)
Mỗi ý tưởng phải kèm 1 câu hook nói to được. Dùng các mẫu:
- **Cảnh báo:** "Đừng đặt cọc mua nhà nếu chưa xem video này."
- **Con số cụ thể:** "3 tỷ ở [khu vực] mua được gì? Đây là câu trả lời."
- **Phản trực giác:** "Mua nhà lúc giá giảm chưa chắc đã lời."
- **Câu hỏi đúng nỗi đau:** "Lương 15 triệu, bao giờ mới mua được nhà?"
- **Bí mật nghề:** "Môi giới ít khi nói cho bạn điều này."
- **So sánh:** "Căn hộ 2 tỷ vs nhà phố 2 tỷ — chọn cái nào?"

Hook phải trung thực với nội dung; không giật tít sai sự thật, không hứa lợi nhuận.

## Đầu ra
Trả về bảng (mặc định 10 ý tưởng):

| # | Trụ cột | Tiêu đề làm việc | Hook (câu nói đầu) | Định dạng | Độ dài | Vì sao dễ viral |

- **Định dạng:** nói trước camera / tham quan thực tế / faceless / màn hình xanh trên ảnh–tin tức / trả lời bình luận.
- Sau bảng, gợi ý **1 series** (3–5 tập nối tiếp) từ các ý tưởng mạnh nhất.
- Đánh dấu ⚠️ ý tưởng nào cần kiểm tra số liệu/pháp lý trước khi quay, và nhắc chạy skill `bds-kiem-tra-tuan-thu`.

## Nguyên tắc
- Cụ thể theo khu vực và tầm giá trong hồ sơ kênh; tránh ý tưởng chung chung.
- Không bịa số liệu giá, lãi suất, quy hoạch. Nếu cần con số, ghi "[cần cập nhật số liệu thực tế]".
- Không đưa ý tưởng khuyến nghị đầu tư chắc thắng, "x2 tài sản", "chắc chắn tăng giá".
