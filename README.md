# Bộ skill Claude cho kênh TikTok Bất động sản

Bộ skill giúp Claude hỗ trợ sản xuất nội dung cho một kênh TikTok ngách bất động sản (BĐS) tại Việt Nam.

## Cài trên máy Mac (làm 1 lần)

Mở ứng dụng **Terminal** rồi dán từng lệnh:

```bash
# 1. Tải repo về thư mục ~/claude-skills
git clone https://github.com/thuynguyenxg2912-ui/claude-skills.git ~/claude-skills
cd ~/claude-skills && git checkout claude/tender-ramanujan-1p42dd

# 2. Chép các skill vào thư mục skill của Claude
mkdir -p ~/.claude/skills && cp -R ~/claude-skills/skills/* ~/.claude/skills/
```

3. Cài skill dựng video **edit-video-tung-dung**: giải nén gói zip, bấm đúp `CAI-DAT-MAC.command` (gói này để riêng, không đưa vào repo).
4. **Thoát hẳn Claude rồi mở lại.**

Cập nhật khi repo có thay đổi:
```bash
cd ~/claude-skills && git pull && cp -R skills/* ~/.claude/skills/
```

Hồ sơ kênh nằm ở `~/claude-skills/kenh-profile.md`. Mọi skill tự tìm file này để giữ giọng điệu, khu vực, đối tượng và phong cách edit nhất quán.

## Dùng hằng ngày

Mở Claude (tab Code) ở thư mục chứa video, rồi nói tự nhiên:
- *"Cho em 10 ý tưởng video tuần này"*
- *"Viết kịch bản 45 giây về cách kiểm tra sổ hồng"*
- *"Edit video này: ten-video.mp4"*

## Các skill

| Skill | Dùng khi |
|---|---|
| [`bds-y-tuong-video`](skills/bds-y-tuong-video/SKILL.md) | Cần ý tưởng video, chủ đề, series |
| [`bds-kich-ban-tiktok`](skills/bds-kich-ban-tiktok/SKILL.md) | Viết kịch bản 15–90 giây có hook, cảnh quay, chữ trên màn hình |
| [`bds-caption-hashtag`](skills/bds-caption-hashtag/SKILL.md) | Viết caption, hashtag, tiêu đề bìa, bình luận ghim |
| [`bds-kiem-tra-tuan-thu`](skills/bds-kiem-tra-tuan-thu/SKILL.md) | Rà soát rủi ro pháp lý & chính sách TikTok trước khi đăng |
| [`bds-lich-dang-bai`](skills/bds-lich-dang-bai/SKILL.md) | Lên lịch đăng tuần/tháng theo tỷ lệ trụ cột nội dung |
| [`bds-edit-video`](skills/bds-edit-video/SKILL.md) | **"Edit video này"**: áp chuẩn kênh BĐS rồi gọi skill dựng `edit-video-tung-dung`, sau đó kiểm tra tuân thủ và viết caption |
| [`bds-hieu-ung-chu-sau-nguoi`](skills/bds-hieu-ung-chu-sau-nguoi/SKILL.md) | Chữ lớn sau người dẫn, phụ đề tránh mặt (chạy trên Mac, dùng `tools/mac-vision`) |

## Quy trình gợi ý

```
ý tưởng → kịch bản → quay → "edit video này" (dựng + kiểm tra tuân thủ + caption) → đăng theo lịch
```

> Lưu ý: skill tuân thủ chỉ giúp phát hiện rủi ro thường gặp, không thay thế tư vấn pháp lý.
