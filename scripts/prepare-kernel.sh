#!/bin/bash

echo "Installing dependencies..."
poetry install

echo "Installing Jupyter kernel..."
poetry run python -m ipykernel install --user --name=myenv --display-name "Python (myenv)"

echo "Setup complete. You can now use Jupyter with your Poetry environment."
