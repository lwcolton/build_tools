set -e
pip3 install -U -r /tmp/requirements.txt
pip3 install -U --force-reinstall -r /tmp/git_requirements.txt
pip3 install file:///tmp/requirements_dir/app_core
mv /tmp/<APP_NAME> /app
mv /tmp/<UPSTART SERVICE> /etc/init/
chown app:root /app
chmod 770 /app
