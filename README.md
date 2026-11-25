# Bộ skill Claude cho kênh TikTok Bất động sản

Bộ skill giúp Claude hỗ trợ sản xuất nội dung cho một kênh TikTok ngách bất động sản (BĐS) tại Việt Nam.

## Bắt đầu

1. Điền thông tin kênh vào [`kenh-profile.md`](kenh-profile.md) — mọi skill đều đọc file này để giữ giọng điệu, khu vực và đối tượng nhất quán.
2. Cài skill: sao chép thư mục `skills/` vào `.claude/skills/` của dự án (hoặc `~/.claude/skills/` để dùng mọi nơi), hoặc nén từng thư mục skill để tải lên claude.ai.
3. Gọi skill bằng lời thường, ví dụ: *"Cho mình 10 ý tưởng video tuần này"*, *"Viết kịch bản 45 giây về cách kiểm tra sổ hồng"*.

## Các skill

| Skill | Dùng khi |
|---|---|
| [`bds-y-tuong-video`](skills/bds-y-tuong-video/SKILL.md) | Cần ý tưởng video, chủ đề, series |
| [`bds-kich-ban-tiktok`](skills/bds-kich-ban-tiktok/SKILL.md) | Viết kịch bản 15–90 giây có hook, cảnh quay, chữ trên màn hình |
| [`bds-caption-hashtag`](skills/bds-caption-hashtag/SKILL.md) | Viết caption, hashtag, tiêu đề bìa, bình luận ghim |
| [`bds-kiem-tra-tuan-thu`](skills/bds-kiem-tra-tuan-thu/SKILL.md) | Rà soát rủi ro pháp lý & chính sách TikTok trước khi đăng |
| [`bds-lich-dang-bai`](skills/bds-lich-dang-bai/SKILL.md) | Lên lịch đăng tuần/tháng theo tỷ lệ trụ cột nội dung |

## Quy trình gợi ý

```
ý tưởng → kịch bản → kiểm tra tuân thủ → caption/hashtag → đăng theo lịch
```

> Lưu ý: skill tuân thủ chỉ giúp phát hiện rủi ro thường gặp, không thay thế tư vấn pháp lý.
