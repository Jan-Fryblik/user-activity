#!/bin/sh

. ./conf/activity.conf

# create activities folder in default location
echo 'Creating application folder...';
mkdir -p ${base_app_folder};
mkdir -p ${activities_folder};

echo 'Copying application  scripts...'
cp ./src/activity.sh ${base_app_folder}

echo 'Correcting permissions...'
chmod 755 ${base_app_folder}
chown root:root ${base_app_folder}

executableFile=${base_app_folder}/activity.sh
chmod 755 ${executableFile}
chown root:root ${executableFile}

echo 'Creating configuration folder...';
mkdir /etc/user-activity/

echo 'Copying config files...';
cp -r conf/* /etc/user-activity

echo 'Correcting permissions...'
chmod 755 /etc/user-activity
#chown -R root:root /etc/user-activity

# create link from /usr/bin folder to activity script
echo 'Creating link in /usr/bin/';
ln -s ${executableFile} /usr/bin/user-activity

#set correct permissions






