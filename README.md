# docker-ros2-desktop-vnc

[![Publish to Registry (Humble)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-humble.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-humble.yml)
[![Publish to Registry (Iron)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-iron.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-iron.yml)
[![Publish to Registry (Jazzy)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-jazzy.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-jazzy.yml)
[![Publish to Registry (Rolling)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-rolling.yml/badge.svg)](https://github.com/Tiryoh/docker-ros2-desktop-vnc/actions/workflows/deploy-rolling.yml)

[![Docker Automated build](https://img.shields.io/docker/automated/tiryoh/ros2-desktop-vnc)](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc)
[![](https://img.shields.io/docker/pulls/tiryoh/ros2-desktop-vnc.svg)](https://hub.docker.com/r/tiryoh/ros2-desktop-vnc)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)](code_of_conduct.md)

**Forked from [`Tiryoh/docker-ros2-desktop-vnc`](https://github.com/Tiryoh/docker-ros2-desktop-vnc).**

Dockerfiles to provide HTML5 VNC interface to access Ubuntu Desktop + ROS2, based on [AtsushiSaito/docker-ubuntu-sweb](https://github.com/AtsushiSaito/docker-ubuntu-sweb)

## Build

To build Docker image from this Dockerfile, run the following command.

Based on [`humble/Dockerfile`](./humble/Dockerfile):
```bash
cd humble && docker build -t tiryoh/ros2-desktop-vnc:humble .
```

## Quick Start

```bash
docker run -p 6080:80 --security-opt seccomp=unconfined --shm-size=512m ghcr.io/tiryoh/ros2-desktop-vnc:humble
```

Browse [`http://127.0.0.1:6080/`](http://127.0.0.1:6080/).

## Run container by script
*E.g.*, `humble`

```bash
cd humble
chmod +x ros_humble.bash
./ros_humble.bash
```

Browse [`http://127.0.0.1:6080/`](http://127.0.0.1:6080/).

```bash
docker exec -it ros_humble bash
```
