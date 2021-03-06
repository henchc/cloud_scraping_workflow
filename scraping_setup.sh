# Author: Christopher Hench

# download miniconda and install
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda-latest-Linux-x86_64.sh
bash Miniconda*.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc

# install apt packages
sudo apt-get -y install zip
sudo apt-get -y install python-pip
sudo apt-get -y install lftp

# download chrome; NOTE: newest version does not allow auto-pdf disable
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
wget http://www.slimjetbrowser.com/chrome/lnx/chrome64_56.0.2924.87.deb
sudo dpkg -i --force-depends chrome64_56.0.2924.87.deb

# download chrome driver
# help from https://christopher.su/2015/selenium-chromedriver-ubuntu/
# and http://blog.likewise.org/2015/01/setting-up-chromedriver-and-the-selenium-webdriver-python-bindings-on-ubuntu-14-dot-04/
# LATEST=$(wget -q -O - http://chromedriver.storage.googleapis.com/LATEST_RELEASE)
# must be 2.29 now
wget http://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip

# unzip chromedriver and put in share and binaries
unzip chromedriver_linux64.zip
chmod +x chromedriver
sudo mv -f chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

# reload rc
source ~/.bashrc

sudo apt-get -fy install

# install relevant packages
pip install bs4
pip install lxml
pip install selenium
pip install jupyter
export XDG_RUNTIME_DIR=""
