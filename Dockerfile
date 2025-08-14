FROM ollama/ollama AS builder

# Start Ollama in the background and pull the model
RUN ollama serve > /dev/null 2>&1 & \
    sleep 5 && \  # Wait for server to start
    ollama pull llama3:8b-instruct-q4_0

# Final stage (optional, reduces image size)
FROM ollama/ollama
COPY --from=builder /root/.ollama /root/.ollama
EXPOSE 11434
CMD ["ollama", "serve"]
