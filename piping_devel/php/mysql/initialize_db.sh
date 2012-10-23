#!/bin/sh
mysql -ui4life -pi4life -e \
'DROP DATABASE IF EXISTS piping_devel;
CREATE DATABASE piping_devel;
USE piping_devel;
\. ./piping.sql'
