FROM ollama/ollama

# Set environment variables
ENV OLLAMA_HOST 0.0.0.0

# Pre-download the model (smaller models work better on Railway)
RUN ollama pull llama3:8b-instruct-q4_0  # Quantized 8B model (smaller memory footprint)

# Expose the API port
EXPOSE 11434

# Start the server
CMD ["ollama", "serve"]
