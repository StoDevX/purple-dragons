#!/bin/bash
pssh -h nodes.txt --inline 'killall chrome'
