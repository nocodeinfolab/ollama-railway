# Use the official Ollama base image
FROM ollama/ollama:latest

# Pull the Mistral 7B Instruct Q4_0 model at build time
RUN ollama pull mistral:7b-instruct-q4_0

# Expose Ollama's default API port
EXPOSE 11434

# Start Ollama server
CMD ["serve"]
