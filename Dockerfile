# Stage 1: Download the model
FROM ollama/ollama AS builder

# Start Ollama in background and pull the model
RUN sh -c "ollama serve > /dev/null 2>&1 &" && \
    sleep 10 && \
    ollama pull llama3:8b-instruct-q4_0

# Stage 2: Create a smaller final image
FROM ollama/ollama
COPY --from=builder /root/.ollama /root/.ollama
EXPOSE 11434
CMD ["ollama", "serve"]
