FROM ollama/ollama

# Pull your preferred model during build (LLaMA 3 in this example)
RUN ollama pull llama3

# Expose Ollama's API port
EXPOSE 11434

# Start Ollama server
CMD ["serve"]
