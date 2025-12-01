#!/bin/bash
set -e

REQ="requirements.txt"

if [ ! -f "$REQ" ]; then
    echo "❌ ERROR: requirements.txt not found at: $(pwd)"
    echo "Put requirements.txt in this folder or edit the script to point to the correct path."
    exit 1
fi

echo "Creating virtual environment..."
uv venv

echo "Activating environment..."
source .venv/bin/activate

echo "Installing requirements from $REQ..."
uv pip install -r "$REQ"

echo "Starting Jupyter Notebook..."
jupyter notebook
