FROM ollama/ollama:latest

# Expose Ollama's API port
EXPOSE 11434

# Override the entrypoint so we can run a shell script
ENTRYPOINT []

# Start Ollama server and pull model at runtime
CMD ["/bin/sh", "-c", "ollama serve & sleep 5 && ollama pull mistral:7b-instruct-q4_0 && wait"]
