# Description: Install Frappe and ERPNext on Ubuntu 22.04-jammy
# Part 2: Run as user

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
