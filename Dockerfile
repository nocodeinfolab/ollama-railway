FROM ollama/ollama:latest

# Expose Ollama's API port
EXPOSE 11434

# Override the entrypoint so we can run a shell script
ENTRYPOINT []

# Clear any existing models and pull a real lightweight model
CMD ["/bin/sh", "-c", "rm -rf /root/.ollama/models/* && ollama serve & sleep 15 && ollama pull tinyllama && wait"]
