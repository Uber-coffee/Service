### Docker swarm setup playbooks

1. Disable host key check:
```export ANSIBLE_HOST_KEY_CHECKING=False```
2. Set credentials environment variables:
```export EPAM_USERNAME=username; export EPAM_PASSWORD=password```
3. Execute:
```
    ansible-playbook -i hosts.yaml playbooks/00-install_docker.yaml
    ansible-playbook -i hosts.yaml playbooks/01-init_docker_swarm.yaml
```
