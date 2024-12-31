#!/bin/bash

find /home/user -type f -size +100M | sed -E 's/' '/'_'/g' | xargs -I {} cp {} /home/user/large_files
