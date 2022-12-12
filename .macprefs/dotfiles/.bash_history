nvm
node
zsh
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .cd getting-started
docker build -t docker101tutorial .
cd getting-started
docker build -t docker101tutorial .
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .
cd getting-started
docker build -t docker101tutorial .
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
docker tag docker101tutorial droxey/docker101tutorial 
docker push droxey/docker101tutorial
