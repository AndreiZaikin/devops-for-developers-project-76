prepare:
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory.ini playbook.yml
deploy:
	ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass
deploy-verbose:
	ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass -v
