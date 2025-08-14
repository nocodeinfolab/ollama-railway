FROM ollama/ollama:latest

# Expose Ollama's API port
EXPOSE 11434

# Override the entrypoint so we can run a shell script
ENTRYPOINT []

# Clear any existing models and pull only the lightweight one
CMD ["/bin/sh", "-c", "rm -rf /root/.ollama/models/* && ollama serve & sleep 10 && ollama pull tinyllama:1.1b-chat-v1.0-q4_0 && wait"]
