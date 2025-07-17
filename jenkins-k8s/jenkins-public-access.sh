#!/bin/bash

# 获取外部IP
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)
INTERNAL_IP=$(hostname -I | awk '{print $1}')

echo "🚀 Jenkins 公网访问配置"
echo "=========================="
echo "📍 外部IP: $PUBLIC_IP"
echo "📍 内部IP: $INTERNAL_IP"
echo "🔗 Jenkins URL: http://$PUBLIC_IP:8080"
echo "👤 用户名: admin"
echo "🔐 密码: admin123"
echo ""
echo "⚠️  注意：请确保防火墙允许端口 8080 的访问"
echo ""
echo "📝 端口转发状态:"
ps aux | grep "kubectl port-forward" | grep -v grep || echo "❌ 端口转发未运行"
echo ""
echo "🔄 如需重启端口转发，请运行:"
echo "   pkill -f 'kubectl port-forward'"
echo "   nohup kubectl port-forward --address 0.0.0.0 -n jenkins svc/jenkins 8080:8080 > /tmp/jenkins-port-forward.log 2>&1 &"
