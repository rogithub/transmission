# transmission
transmission Container setup

# Get current user id


# Service config
``` bash
podman generate systemd --new --name transmission
```
``` bash
mv transmission /etc/systemd/system/transmission.service
```

``` bash
systemctl list-unit-files | grep transmission
```

``` bash
systemctl enable transmission
systemctl start transmission
systemctl status transmission
```


# Container management
``` bash
podman exec -it transmission bin/bash
```
``` bash
podman logs -f transmission
```
