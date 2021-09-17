#! /bin/bash
# set dry_run to 1 to enable check, and 0 to execute the playbooks
dry_run=1
key_path=/home/user/ansible-kubernetes/create-k8s-cluster-with-ansible/1-user-setup/

opr=""
if [ $dry_run -eq 1 ] 
	then
		opr="--check"
	else
		opr=""
fi

# ansible begin
ansible-playbook -i ./1-user-setup/inventory ./1-user-setup/main.yaml -e "master_ssh_key_path=$key_path/master-key worker_ssh_key_path=$key_path/worker-key" -K $opr

ansible-playbook -i inventory-final ./2-k8s-prerequisite/main.yaml $opr
