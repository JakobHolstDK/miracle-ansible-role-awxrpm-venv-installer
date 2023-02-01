docker volume create --driver local \
    --opt type=none \
    --opt device=/var/opt/awxinabox/dist \
    --opt o=bind awx_data

