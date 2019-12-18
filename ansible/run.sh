#!/bin/bash -ex

cd "$( dirname "${BASH_SOURCE[0]}" )"

#ANSIBLE_NOCOWS=1 ANSIBLE_CONFIG="$(pwd)/ansible.cfg" ansible-playbook -i "$(pwd)/hosts.ini" playbook.yml "$@"

docker run -it --rm \
  --env ANSIBLE_NOCOWS=1 \
  --env ANSIBLE_CONFIG=/app/ansible.cfg \
  --env ANSIBLE_SSH_CONTROL_PATH_DIR=/tmp/.ansible.cp \
  --user "$(id -u):$(id -g)" \
  --volume "$HOME/.ssh:$HOME/.ssh:ro" \
  --volume "$HOME/.ansible:$HOME/.ansible" \
  --volume "/etc/passwd:/etc/passwd:ro" \
  --volume "$PWD:/app" \
  --workdir "/app" \
  ansible/ansible-runner:1.4 \
  ansible-playbook -i "hosts.ini" playbook.yml "$@"
