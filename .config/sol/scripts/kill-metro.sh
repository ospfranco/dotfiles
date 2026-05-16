#!/bin/bash

# name: Kill Metro
# icon: 🔪

lsof -n -i4TCP:8081 | grep "node" | awk '{print $2}' | xargs kill