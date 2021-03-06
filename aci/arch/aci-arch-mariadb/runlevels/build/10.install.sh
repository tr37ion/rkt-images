#!/dgr/bin/busybox sh
set -e
. /dgr/bin/functions.sh
isLevelEnabled "debug" && set -x

pacman -S mariadb --noconfirm

app="mysql"
user=$(cat /etc/passwd | grep ${app} | cut -f3 -d:)
group=$(cat /etc/passwd | grep ${app} | cut -f4 -d:)

cat > /dgr/builder/attributes/user.yml <<EOF
default:
  user: ${user}
  group: ${group}
EOF

exit 0
