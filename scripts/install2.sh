cd ~
bench init erp --frappe-branch version-15
cd ~/erp
bench new-site mysite
bench get-app erpnext --branch version-15
bench get-app hrms --branch version-15