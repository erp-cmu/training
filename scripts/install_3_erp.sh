# Description: Install Frappe and ERPNext on Ubuntu 22.04-jammy
# Part 3: run while another terminal has `bench start` running 

cd ~/erp

# Install app onto mysite
bench --site mysite install-app erpnext
bench --site mysite install-app hrms
bench --site mysite enable-scheduler
bench use mysite
