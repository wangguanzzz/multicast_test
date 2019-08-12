#!/bin/bash
nohup ansible-playbook -i ansible/hosts ansible/01_receiver.yml > result.txt &
sleep 5
ansible-playbook -i ansible/hosts ansible/02_sender.yml
