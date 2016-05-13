sudo apt-get update
sudo apt-get install -y build-essential python3-dev libssl-dev libncurses5-dev libreadline6-dev libffi-dev libsqlite3-dev

sudo curl -L https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz -o /tmp/python-3.4.tar.xz

sudo sh -c "cd /tmp && mkdir python-3.4 && tar -xf python-3.4.tar.xz -C python-3.4 --strip-components=1"

sudo sh -c "cd /tmp/python-3.4 && ./configure && make && sudo make altinstall"
