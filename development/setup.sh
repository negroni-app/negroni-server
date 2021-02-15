#!/bin/bash

#######################################
NC='\033[0m' # No Color
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
#######################################
MARIA_DB_VERSION=10.5
GO_VERSION=1.15
######################################

install_docker() {
  # TODO: brew cask install docker
  echo -e "${GREEN}Installing Docker...${NC}";
  echo -e "${GREEN}Installing Docker Compose...${NC}";
}

install_mariadb() {
  echo -e "${GREEN}Installing Mariadb ${MARIA_DB_VERSION} ...${NC}";
 
  if brew list --version mariadb@${MARIA_DB_VERSION} > /dev/null
  then
    echo -e "${YELLOW}Mariadb ${MARIA_DB_VERSION} is already installed${NC}";
  else
    brew install "mariadb@${MARIA_DB_VERSION}"
  fi
}

install_golang() {
  echo -e "${GREEN}Installing Go ${GO_VERSION} ...${NC}";
  if brew list --version go@${GO_VERSION} > /dev/null
  then
    echo -e "${YELLOW}Go ${GO_VERSION} is already installed${NC}";
  else
    brew install "go@${GO_VERSION}";
  fi
}

start_docker_compose() {
  echo -e "${GREEN}Development Environment Docker is now starting...";
  docker-compose up -d
  sleep 5 # For waiting Docker Compose components are fully boiling"
}

setup_mariadb() {
  executor="/usr/local/opt/mariadb@${MARIA_DB_VERSION}/bin/mariadb -h 127.0.0.1 -u root -pnegroni";
  create_database_command="CREATE DATABASE IF NOT EXISTS negroni;";
  create_user_command="CREATE USER IF NOT EXISTS negroni IDENTIFIED BY 'twoshotplease';";
  
  echo -e "${GREEN}Create database 'negroni'${NC}...";
  echo ${create_database_command} | ${executor};
  echo -e "${GREEN}Done${NC}"

  echo -e "${GREEN}Create user'negroni'${NC}...";
  echo ${create_user_command} | ${executor};
  echo -e "${GREEN}Done${NC}"
}

install_go_dependencies() {
 cd ../ && go get
}

install_docker
install_mariadb
install_golang
start_docker_compose
setup_mariadb
install_go_dependencies

