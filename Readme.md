# Play Computer

This repo contains tools for setting up a computer for usage with Divdat Play.

## Directories

-   `roles/`: Ansible roles
-   `utils/`: Utilities

## Ansible playbook

The Ansible playbook `ubuntu.yml` will configure a Ubuntu system to run Dividat Play.

To run it:
```
ansible-playbook -i HOSTNAME, ubuntu.yml"
```

You may also define the URL of the Play installation (useful for testing out development version at `dev.dividat.com`):
```
ansible-playbook -i HOSTNAME, ubuntu.yml --extra-vars "play_url=https://dev.dividat.com/play.html"
```

If you are on the Ubuntu machine that should be set up for usage with Play you might want to pull the ansible playbook instead:
```
ansible-pull -U https://github.com/dividat/play-computer.git ubuntu.yml -i localhost, --purge
```
