prepare:
	ansible-galaxy install -r requirements.yml
	ansible-playbook -i inventory.ini playbook.yml

