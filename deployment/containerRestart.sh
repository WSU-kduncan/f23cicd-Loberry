#!/bin/bash

sudo docker pull loberry/project4_repo:latest

sudo docker restart $(sudo docker ps -q)