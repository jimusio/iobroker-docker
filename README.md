# iobroker-docker
docker build files for iobroker

# Installation
cd BACKUP_FOLDER
docker run --name=iobroker --net=host -v $(pwd):/opt/iobroker/backups -t jimus/iobroker
