FROM ollama/ollama:latest

# Expose Ollama's API port
EXPOSE 11434

# Override the entrypoint so we can run a shell script
ENTRYPOINT []

# Use the smallest available model that fits in 512MB RAM
# TinyLlama is specifically designed for resource-constrained environments
CMD ["/bin/sh", "-c", "ollama serve & sleep 10 && ollama pull tinyllama:1.1b-chat-v1.0-q4_0 && wait"]
