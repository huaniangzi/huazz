#!/bin/bash

# 同步在线状态、清理7天前过期订单、关闭过期订单
sync_online_status() {
    curl -sS --connect-timeout 10 -m 60 'https://pay.ttiii.top/index/cron?key=8c6a8ab6fbe2006492d9aaddf45de80f'
    endDate=$(date +"%Y-%m-%d %H:%M:%S")
    echo "★[$endDate] Sync online status Successful"
}

# 监控支付宝回调
monitor_alipay_callback() {
    curl -sS --connect-timeout 10 -m 60 'https://pay.ttiii.top/index/cron/ali?key=8c6a8ab6fbe2006492d9aaddf45de80f'
    endDate=$(date +"%Y-%m-%d %H:%M:%S")
    echo "★[$endDate] Alipay callback monitoring Successful"
}

# 执行任务
execute_tasks() {
    sync_online_status
    monitor_alipay_callback
}

# 主逻辑
execute_tasks

exit 0
