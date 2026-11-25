---
name: bds-lich-dang-bai
description: Lên lịch đăng bài TikTok bất động sản theo tuần hoặc tháng, cân bằng trụ cột nội dung, khung giờ đăng và kế hoạch quay gộp (batch). Dùng khi người dùng cần lịch đăng, content calendar, kế hoạch nội dung tuần/tháng, hoặc hỏi nên đăng mấy video, giờ nào.
---

# Lịch đăng bài TikTok Bất động sản

## Đầu vào
- `kenh-profile.md`: mục tiêu, định dạng, độ dài, khu vực.
- Hỏi (nếu chưa biết): khoảng thời gian (tuần/tháng), số video/tuần làm được thực tế, ngày nào rảnh để quay.
- Mặc định nếu không có thông tin: **5 video/tuần**, kênh mới.

## Tỷ lệ trụ cột (mặc định cho kênh mới)
| Trụ cột | Tỷ lệ |
|---|---|
| Kiến thức / pháp lý | 30% |
| Cảnh báo / sai lầm | 25% |
| Tài chính / con số | 20% |
| Thực tế / tham quan | 15% |
| Hậu trường / cá nhân | 10% |

Điều chỉnh theo mục tiêu: muốn khách hỏi → tăng "Thực tế"; muốn follower → tăng "Cảnh báo" và "Tài chính".

## Khung giờ gợi ý
Khán giả BĐS thường là người đi làm: **11:30–13:00** và **19:30–22:00** ngày thường; cuối tuần **9:00–11:00** và **20:00–22:00**. Ghi rõ đây là điểm khởi đầu — sau 2–3 tuần cần xem TikTok Analytics (mục Người theo dõi → giờ hoạt động) và điều chỉnh.

## Đầu ra

**Bảng lịch:**

| Ngày | Giờ đăng | Trụ cột | Chủ đề / tiêu đề làm việc | Hook | Định dạng | Ngày quay | Trạng thái |
|---|---|---|---|---|---|---|---|

- Trạng thái mặc định: `Ý tưởng`.
- Không đặt 2 video cùng trụ cột liên tiếp.
- Gom các video cùng địa điểm/trang phục vào **cùng ngày quay** (batch) và liệt kê riêng: "Buổi quay 1: video #1, #3, #6 — tại …".

**Sau bảng:**
- Mục tiêu đo lường tuần: lượt xem trung bình, tỷ lệ xem hết, lượt lưu, follower mới, tin nhắn hỏi.
- 1 thử nghiệm A/B cho tuần (ví dụ: hook câu hỏi vs hook con số).
- Gợi ý dùng skill `bds-kich-ban-tiktok` cho từng dòng và `bds-kiem-tra-tuan-thu` trước khi đăng.

Nếu người dùng muốn file, xuất thêm CSV với cùng cột để nhập Google Sheets/Notion.
