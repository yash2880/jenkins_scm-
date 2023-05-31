#!/bin/bash

# SSH into the remote server and execute commands
ssh -i id_rsa yashwanth.s@192.168.7.17 << EOF  # Change to the desired directory
    bash kafka-docker.sh
EOF
