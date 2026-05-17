prepare:
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory.ini playbook.yml --extra-vars "@extra_vars.yml"
deploy:
	ansible-playbook -i inventory.ini playbook.yml --extra-vars "@extra_vars.yml"
deploy-verbose:
	ansible-playbook -i inventory.ini playbook.yml --extra-vars "@extra_vars.yml" -v
