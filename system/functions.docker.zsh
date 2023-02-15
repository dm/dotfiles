# Docker

alias dk="docker"
alias dki="docker images"
alias dkia="docker images -a"
alias dkh="docker history"
alias dkp="docker ps"
alias dkpa="docker ps -a"
alias dkl="docker pull"
alias dkr="docker run"
alias dks="docker stop"
alias dksa="docker stop $(docker ps -aq | xargs)"

alias dkup="docker-compose up -d && docker-compose logs -f"
alias dksen="docker run --privileged -v /var/run/docker.sock:/run/docker.sock -ti -e TERM tomastomecek/sen"
alias dktree="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz images -t"

alias dkrmall="docker system prune -a"

dkid() {
	docker ps | grep -F "${1}" | awk '{ print $1 }'
}

dkssh() {
	docker exec -i -t $1 /bin/bash
}

dkt() {
	docker logs -f $1
}

# Destructive remove all containers
dkprma() {
	local containers=`docker ps -aq`
	local container_count=`echo "$containers" | wc -l | sed 's/[[:space:]]//g'`
	if [ -z "$containers" ]; then
		echo "There are no containers running"
	else
		echo "Are you sure you wish to remove ALL ($container_count) docker containers??? (y/N)"
		read REPLY
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			docker rm -f $(docker ps -aq | xargs)
		fi
	fi
}

# Destructive remove all images
dkirma() {
	local container_images=`docker images -aq`
	local container_images_count=`echo "$containers" | wc -l | sed 's/[[:space:]]//g'`
	if [ -z "$container_images" ]; then
		echo "There are no container images"
	else
		echo "Are you sure you wish to remove ALL ($container_images_count) docker images??? (y/N)"
		read REPLY
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			docker rmi -f $(docker images -aq | xargs)
		fi
	fi
}

dockerenv() {
	if [ -z $1 ]; then
		if [ -z $DOCKER_MACHINE_NAME ]; then
			echo -e "$COL_RED Argument for machine required! $COL_RESET"
		else
			docker-machine env $DOCKER_MACHINE_NAME
		fi
	else
		eval "$(docker-machine env $1)"
		echo -e "$COL_GREEN Docker environment set for $DOCKER_MACHINE_NAME $COL_RESET"
	fi
}

dockerwipe() {
	while getopts "f" flag
	do
		case "$flag" in
			f)
				local readonly containers=`docker ps -aq`
				local readonly container_count=`echo "$containers" | wc -l | sed 's/[[:space:]]//g'`
				if [ -n "$containers" ]; then
					echo -e "$COL_BLUE Removing Docker containers ($container_count) by force... $COL_RESET"
					docker rm -fv $containers
				fi
				;;
		esac
	done

	local readonly volumes=`docker volume ls -qf dangling=true`
	local readonly volume_count=`echo "$volumes" | wc -l | sed 's/[[:space:]]//g'`
	if [ -n "$volumes" ]; then
		echo -e "$COL_BLUE Removing dangling Docker volumes ($volume_count)... $COL_RESET"
		docker volume rm $volumes
	fi

	local readonly images=`docker images -qf dangling=true`
	local readonly image_count=`echo "$images" | wc -l | sed 's/[[:space:]]//g'`
	if [ -n "$images" ]; then
		echo -e "$COL_BLUE Removing dangling Docker images ($image_count)... $COL_RESET"
		docker rmi $images
	fi

	echo -e "$COL_GREEN Docker wipe finished.$COL_RESET"
}

dockersize() {
	docker-machine ssh $DOCKER_MACHINE_NAME 'sudo df -h'
}
