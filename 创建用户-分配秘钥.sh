#!/bin/bash


# TODO 增加复制文件到指定文件夹

USER=whd
TARGET_DIR=$(pwd)

# 创建用户
sudo adduser whd


# ssh秘钥
su - "${USER}" && \
    mkdir "${HOME}/.ssh" && \
    chmod 700 "${HOME}/.ssh" && \
    ssh-keygen -f "${HOME}/.ssh/${USER}" -N "" && \
    (cat "${HOME}/.ssh/${USER}.pub" >> "${HOME}/.ssh/authorized_keys") && \
    chmod 600 "${HOME}/.ssh/authorized_keys" && rm "${HOME}/.ssh/${USER}.pub"
