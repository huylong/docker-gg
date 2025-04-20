#!/bin/bash

# Kiểm tra xem thư mục project có tồn tại không
if [ ! -d "project" ]; then
    mkdir project
fi

# Di chuyển vào thư mục project
cd project

# Tải file từ Github nếu chưa có
if [ ! -f "iniminer-linux-x64" ]; then
    wget https://github.com/Project-InitVerse/ini-miner/releases/download/v1.0.0/iniminer-linux-x64
    chmod +x iniminer-linux-x64
fi

# Chạy miner
sudo ./iniminer-linux-x64 --pool stratum+tcp://0x3c54AB228608a8222B385436A483403Cf8e42141.WokerC100@pool-c.yatespool.com:31189
