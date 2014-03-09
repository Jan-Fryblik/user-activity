#!/bin/sh

. ./conf/activity.conf

#todo: ask before y/n

rm -r "${base_app_folder}";
rm -r "/etc/user-activity/";

rm "/usr/bin/user-activity"

