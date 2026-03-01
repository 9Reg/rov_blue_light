#!/bin/bash
set -e

# Start Ollama service in the background
echo "Starting Ollama server..."
ollama serve > /workspaces/rov_blue_light/ollama.log 2>&1 &

# Wait for the service to be ready
echo "Waiting for Ollama to become responsive..."
while ! curl -s http://localhost:11434/api/tags > /dev/null; do
    sleep 1
done
echo "Ollama is ready!"

# Pull the Qwen2.5-Coder 7b model (this might take a few minutes the first time)
echo "Pulling qwen2.5-coder:7b model..."
ollama pull qwen2.5-coder:7b
echo "Qwen2.5-Coder 7B is ready for local AI!"
