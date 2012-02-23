#!/bin/bash
ssh -i ~vagrant/.ssh/github-id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $1 $2
