#!/bin/bash

create_venv() {
    echo "Creating virtual environment..."
    python3 -m venv venv
    source "./venv/bin/activate"
    pip install -U pip
    echo "Virtual environment create and activated."
    install_dependencies
}

check_venv() {
    if [ -z ${VIRTUAL_ENV} ]; then
        echo "You don't have a virtual environment activated. Activating one now..."
        source ./venv/bin/activate
        echo "Virtual environment activated."
    else
        echo "You already have a virtual environment activated."
    fi
}

install_dependencies() {
    echo "Installing requirements..."
    pip install -r requirements.txt
    echo "Requirements installed."
}

$*
