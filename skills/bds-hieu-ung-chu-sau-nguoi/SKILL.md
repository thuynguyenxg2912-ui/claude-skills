---
name: bds-hieu-ung-chu-sau-nguoi
description: Tạo hiệu ứng chữ lớn nằm SAU người dẫn (chữ chen giữa nền và người) và đặt phụ đề tránh che mặt cho video TikTok, dùng công cụ Mac Vision (segtool, facedet) cùng ffmpeg trên máy Mac. Dùng khi người dùng muốn chữ sau người, tách nền, tách người khỏi video, đặt chữ không che mặt, hoặc nhắc tới segtool/facedet/mac vision.
---

# Hiệu ứng chữ sau người & phụ đề tránh mặt

Công cụ nằm ở `tools/mac-vision/` (đọc README ở đó). **Chỉ chạy trên macOS.** Nếu phiên làm việc không phải Mac (ví dụ Linux/cloud), nói rõ với người dùng rằng các lệnh phải chạy trên Mac của họ, rồi đưa lệnh cho họ chạy, hoặc dùng máy Mac được kết nối nếu có.

Cần có `ffmpeg` (`brew install ffmpeg`).

## Khi nào nên dùng
- Hook 0–3 giây: chữ to như "ĐÀ NẴNG", "3 TỶ", "1/7/2026" đứng sau người dẫn. Đây là hiệu ứng thu hút, hợp với video quay ngoài trời ở biển hoặc dự án.
- Đặt phụ đề/tiêu đề tránh che khuôn mặt.
- Không nên dùng cả video, chỉ dùng cho 1–3 đoạn nhấn mạnh để giữ nhịp.

## Quy trình chữ sau người

Đặt tên: `IN=video.mp4`, chữ muốn chèn, thời điểm bắt đầu và kết thúc (giây). Chạy trong một thư mục làm việc riêng.

```bash
# 1. Tách khung hình (đúng fps của video, thường 30)
mkdir -p frames masks
ffmpeg -i "$IN" -vf fps=30 frames/%05d.png

# 2. Tạo mặt nạ người (mất vài phút với video 1 phút)
/đường/dẫn/tools/mac-vision/segtool frames masks

# 3. Ghép: vẽ chữ lên nền, rồi đặt người (theo mặt nạ) đè lên chữ
FONT="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
ffmpeg -framerate 30 -i frames/%05d.png -framerate 30 -i masks/%05d.png -i "$IN" \
  -filter_complex "[0:v]split[a][b];\
[a]drawtext=fontfile='$FONT':text='ĐÀ NẴNG':fontsize=220:fontcolor=white:\
x=(w-text_w)/2:y=h*0.30:enable='between(t,0,3)'[txt];\
[1:v]format=gray[m];[b][m]alphamerge[p];\
[txt][p]overlay=format=auto,format=yuv420p[v]" \
  -map "[v]" -map 2:a? -c:v libx264 -crf 18 -c:a copy -shortest out.mp4
```

Ghi chú:
- Đặt chữ ở `y` sao cho **phần dưới của chữ chạm vào đầu/vai** người dẫn thì hiệu ứng mới rõ. Dùng `facedet` để biết vị trí đầu (xem dưới).
- Chữ tiếng Việt có dấu cần font hỗ trợ (Arial, SF Pro, Be Vietnam Pro…).
- Chỉ cần làm cho đoạn có hiệu ứng: có thể cắt đoạn đó ra (`-ss`/`-t`) để xử lý nhanh rồi ghép lại trong CapCut.
- Xong thì xoá thư mục `frames/` và `masks/` (rất nặng).

## Quy trình phụ đề tránh mặt
```bash
ffmpeg -i "$IN" -vf fps=1 faces_in/%05d.png      # 1 ảnh/giây là đủ
/đường/dẫn/tools/mac-vision/facedet faces_in > faces.txt
```
- Đọc `faces.txt`: `y` là toạ độ dọc (0 = mép trên, 1 = mép dưới).
- Đặt phụ đề ở vùng **không** giao với khoảng `y` của mặt, đồng thời trong vùng an toàn TikTok: tránh 15% dưới cùng và cột phải (nút thả tim, bình luận).
- Thường mặt nằm ở y 0,2–0,35 thì phụ đề đặt khoảng y 0,55–0,70, đúng như phong cách hiện tại của kênh.

## Đầu ra khi người dùng nhờ
1. Hỏi (nếu thiếu): file video, chữ cần chèn, giây bắt đầu–kết thúc.
2. Đưa đúng bộ lệnh đã điền sẵn tên file, chữ, thời điểm.
3. Nhắc kiểm tra: chữ không che mặt, đọc được trên điện thoại, nằm trong vùng an toàn.
4. Nội dung chữ vẫn phải qua `bds-kiem-tra-tuan-thu` (không ghi cam kết lợi nhuận, lời tuyệt đối).
