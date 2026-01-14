#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./ros2_desktop_vnc_humble.bash [HOST_SRC_DIR]
#
# Env overrides:
#   IMAGE      (default: tiryoh/ros2-desktop-vnc:humble)
#   NAME       (default: ros_humble)
#   HOST_PORT  (default: 6080)
#   SHM_SIZE   (default: 512m)
#   USER       (default: whcheng)
#   PASSWORD   (default: robot)

IMAGE="${IMAGE:-tiryoh/ros2-desktop-vnc:humble}"
NAME="${NAME:-ros_humble}"
HOST_PORT="${HOST_PORT:-6080}"
SHM_SIZE="${SHM_SIZE:-512m}"
USER_NAME="${USER:-whcheng}"
PASSWORD_VALUE="${PASSWORD:-robot}"

HOST_SRC_DIR="${1:-$HOME/src}"
CONTAINER_SRC_DIR="/home/${USER_NAME}/src"

mkdir -p "$HOST_SRC_DIR"

if docker ps -a --format '{{.Names}}' | grep -qx "$NAME"; then
  docker start "$NAME" >/dev/null
  echo "Started existing container: ${NAME}"
  echo "VNC:   http://127.0.0.1:${HOST_PORT}/"
  echo "Shell: docker exec -it -u ${USER_NAME} ${NAME} bash"
  exit 0
fi

docker run -d \
  --name "$NAME" \
  -p "${HOST_PORT}:80" \
  --security-opt seccomp=unconfined \
  --shm-size="$SHM_SIZE" \
  -e "USER=$USER_NAME" \
  -e "PASSWORD=$PASSWORD_VALUE" \
  -v "${HOST_SRC_DIR}:${CONTAINER_SRC_DIR}:rw" \
  "$IMAGE"

echo "VNC:   http://127.0.0.1:${HOST_PORT}/"
echo "Shell: docker exec -it -u ${USER_NAME} ${NAME} bash"