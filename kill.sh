#!/bin/bash
pssh -h nodes.txt --inline 'killall chrome'
#pssh -h nodes.txt --inline 'pkill -o chrome'
