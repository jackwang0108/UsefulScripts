#! /bin/bash


if ! python -m pip show termdown > /dev/null 2>&1; then
    python -m pip install termdown -i https://pypi.tuna.tsinghua.edu.cn/simple
fi

# 用法 termdown 时间 -f 字体 -T 标题
termdown 2h5min -T "Title"
