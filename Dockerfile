FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
        python3 \
        cmake g++ pip wget git \
        libyaml-cpp-dev \
        libasio-dev libtinyxml2-dev

RUN pip3 install -U colcon-common-extensions vcstool

RUN mkdir -p /DDS-Router/src && cd DDS-Router\
    wget https://raw.githubusercontent.com/eProsima/DDS-Router/main/ddsrouter.repos && \
    vcs import src < ddsrouter.repos

RUN colcon build

ENTRYPOINT source /DDS-Router/install/setup.bash
