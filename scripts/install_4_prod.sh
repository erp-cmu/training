# Description: Install Frappe and ERPNext on Ubuntu 22.04-jammy
# Part 4: Setup for production.  Make sure that the terminal is **not** running `bench start`

cd ~/erp

# Set up production
sudo bench setup production $USER

# Replace user in nginx.conf
sudo sed -i "s/user www-data/user $USER/g" /etc/nginx/nginx.conf

# Supervisor
sudo ln -sf $HOME/erp/config/supervisor.conf /etc/supervisor/conf.d/frappe-bench.conf
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl status