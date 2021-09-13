#!/bin/bash
sv down httpd; echo "httpd stoped";
apachectl stop;
sv down mysqld; echo "mysqld stoped";

