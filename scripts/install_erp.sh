# Install app onto mysite
bench --site mysite install-app erpnext
bench --site mysite install-app hrms
bench --site mysite enable-scheduler
bench use mysite

# Set up production
sudo bench setup production $USER

# Replace user in nginx.conf
sudo sed -i "s/user www-data/user $USER/g" /etc/nginx/nginx.conf

# Supervisor
sudo ln -sf $HOME/erp/config/supervisor.conf /etc/supervisor/conf.d/frappe-bench.conf
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl status