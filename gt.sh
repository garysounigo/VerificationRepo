#!/bin/bash

. ./config.sh

case $1 in 
	search)
		case $2 in 
			user)
				echo search user
				URL=https://api.github.com/search/users?q=${USERNAME} 
			;;
			repo)
				echo search repo
				URL=https://api.github.com/search/repositories?q=${REPONAME}
			;;
		esac
	;;
	get)
		case $2 in 
			user)
				case $3 in
					auth)
						echo get user auth
						URL=https://api.github.com/user
					;;
					*)
						echo get user
						URL=https://api.github.com/users/${USERNAME}
					;;
				esac 
			;;

			repo)
				case $3 in
					auth)
						echo get repo user auth
						URL=https://api.github.com/user/repos
					;;
					*)
						echo get repo user
						URL=https://api.github.com/users/${USERNAME}/repos
					;;
				esac 
			;;
		esac
	;;
	*)
		echo wrong arg
	;;
esac


curl --verbose -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer ${TOKEN}" -H "X-GitHub-Api-Version: 2022-11-28" "${URL}"
