git remote |grep -q origin  || git remote add origin ssh://github.com/gmarco/docker-dovecot
git push --set-upstream origin master
