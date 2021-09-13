#!/bin/bash
sv up httpd; echo "httpd running";
apachectl start;
sv up mysqld; echo "mysqld running";

