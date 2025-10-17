#!/bin/bash
set -e

### === 获取用户输入 ===
read -rp "请输入要设置的主机名: " NEW_HOSTNAME

# 校验输入是否为空
if [[ -z "$NEW_HOSTNAME" ]]; then
  echo "❌ 错误：主机名不能为空"
  exit 1
fi

### === 设置主机名 ===
echo "🛠 正在设置主机名为: $NEW_HOSTNAME"
hostnamectl set-hostname "$NEW_HOSTNAME"
hostnamectl set-hostname --static "$NEW_HOSTNAME"

echo "✅ 主机名已设置为: $(hostname)"

### === 关闭防火墙 ===
echo "🛡 关闭 firewalld..."
systemctl stop firewalld
systemctl disable firewalld

### === 关闭 SELinux ===
echo "🚫 关闭 SELinux..."
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
setenforce 0 || echo "SELinux 当前不可设置，可能已关闭或未安装"

### === 调整文件描述符限制 ===
echo "📈 设置文件描述符上限为 1048576..."
cat <<EOF > /etc/security/limits.d/99-nofile.conf
* soft nofile 1048576
* hard nofile 1048576
root soft nofile 1048576
root hard nofile 1048576
EOF

### === 系统内核参数优化 ===
echo "⚙️ 调整 sysctl 内核参数..."
cat <<EOF > /etc/sysctl.d/99-custom.conf
fs.file-max = 2097152
EOF
sysctl --system

### === 替换阿里云源 ===
echo "⬆️ 替换阿里云源..."
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=https://mirrors.aliyun.com/rockylinux|g' \
    -i.bak \
    /etc/yum.repos.d/rocky-*.repo

dnf clean all
dnf makecache
dnf -y update


### === 安装常用软件 ===
echo "⬆️ 安装常用软件..."

yum install vim wget epel-release -y

yum install htop -y 

echo "✅ 初始化完成，建议重启系统以使所有设置生效。"

