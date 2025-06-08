#!/bin/bash
# Watchexec only executes guile when file changes
watchexec -w . --exts scm -- guile $1

