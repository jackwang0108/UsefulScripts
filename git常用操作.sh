#!/bin/bash

# 展示最简分支图
git log --oneline --decorate --graph

# 展示带有commit信息的分支图
git log --oneline --decorate-ref --graph
