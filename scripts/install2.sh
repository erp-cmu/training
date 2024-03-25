curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm install 18
nvm use 18
npm install -g yarn
export NODE_VERSION=$(ls $NVM_DIR/versions/node)
sudo ln -s "$NVM_DIR/versions/node/$NODE_VERSION/bin/node" "/usr/local/bin/node"

sudo pip3 install frappe-bench

cd ~
# bench init erp --frappe-branch version-15
# cd ~/erp
# bench new-site mysite
# bench get-app erpnext --branch version-15
# bench get-app hrms --branch version-15