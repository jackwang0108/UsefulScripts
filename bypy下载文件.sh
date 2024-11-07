#!/bin/bash

# 要下载的文件路径，以"我的应用数据/bypy"为根目录
BYPYPATH="07 – The Guardian – 卫报/The Guardian 2015-2023/2022年/"

if ! python -m pip show bypy > /dev/null 2>&1; then
    python -m pip install bypy -i https://pypi.tuna.tsinghua.edu.cn/simple
fi

# TODO 如果是目录则递归下载

# 读取文件
files=()
while IFS='' read -r line; do files+=("$line"); done < <(bypy list "$BYPYPATH" | choose 1:2)

# 遍历数组并下载每个文件
for file in "${files[@]}"; do
    if [[ "$file" == *.pdf ]]; then
        bypy downfile "$BYPYPATH$file"
    fi
done

