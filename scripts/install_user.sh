# Node.js 18
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm install 18
nvm use 18

# Yarn
npm install -g yarn
export NODE_VERSION=$(ls $NVM_DIR/versions/node)
sudo ln -s "$NVM_DIR/versions/node/$NODE_VERSION/bin/node" "/usr/local/bin/node"

# Frappe
sudo pip3 install frappe-bench

# Init bench
cd ~
bench init erp --frappe-branch version-15

# Create new site
cd ~/erp
bench new-site mysite

# Install ERPNext
bench get-app erpnext --branch version-15

# Install HRMS
bench get-app hrms --branch version-15

cd ~/erp