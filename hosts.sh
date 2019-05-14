echo "$(ip a | grep -A1 eth0 | grep inet | sed 's/\s*inet\s*\(.*\)\/..\sbrd.*/\1/') $(hostname).ses-demo.suse.ru $(hostname)" >> /etc/hosts
