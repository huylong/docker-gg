#!/bin/bash

# Tạo script send_ip.sh
cat > send_ip.sh << 'EOL'
#!/bin/bash

# Lấy hostname
hostname=$(hostname)

# Lấy địa chỉ IP từ api.ipify.org
current_ip=$(curl -s 'https://api.ipify.org?format=json' | jq -r '.ip')

# Thông tin bot và chat_id của bạn trên Telegram
bot_token="6719359926:AAELwC7wIgO3hPzVk31CLX_LNthi4V41R_g"
chat_id="-4170767594"

# Tạo nội dung tin nhắn với cả hostname và IP
message="🖥 Hostname: $hostname
🌐 IP Address: $current_ip
⏰ Time: $(date '+%Y-%m-%d %H:%M:%S')"

# Gửi tin nhắn đến Telegram
curl -s -X POST "https://api.telegram.org/bot$bot_token/sendMessage" \
    -d "chat_id=$chat_id" \
    -d "text=$message"

echo "Message sent to Telegram successfully!"
EOL

# Cấp quyền thực thi cho send_ip.sh
chmod +x send_ip.sh

# Kiểm tra và chạy send_ip.sh
if [ -f "send_ip.sh" ]; then
    echo "Found send_ip.sh, executing..."
    ./send_ip.sh
else
    echo "Error: send_ip.sh not found!"
fi
