# download miniconda and install

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

sleep 10

chmod +x Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh

sleep 10

# install relevant scraping packages

pip install bs4
pip install lxml
pip install selenium


# download chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sleep 10

sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb

# download chrome driver
# help from https://christopher.su/2015/selenium-chromedriver-ubuntu/
# and http://blog.likewise.org/2015/01/setting-up-chromedriver-and-the-selenium-webdriver-python-bindings-on-ubuntu-14-dot-04/

LATEST=$(wget -q -O - http://chromedriver.storage.googleapis.com/LATEST_RELEASE)
wget http://chromedriver.storage.googleapis.com/$LATEST/chromedriver_linux64.zip

sleep 10

# unzip chromedriver and put in share and binaries

unzip chromedriver_linux64.zip
chmod +x chromedriver
sudo mv -f chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

# install LFTP for transfer of scraped files to Box

sudo apt-get install lftp