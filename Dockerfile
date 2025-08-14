# Stage 1: Download the model efficiently
FROM ollama/ollama AS builder

# Start Ollama in background, pull smaller quantized model (saves space)
RUN sh -c "ollama serve > /dev/null 2>&1 &" && \
    sleep 15 && \  # Extra wait time for server init
    ollama pull mistral:7b-instruct-q4_0 && \
    rm -rf /root/.ollama/blobs/*  # Clean up temp files (~1-2GB savings)

# Stage 2: Create lean final image
FROM ollama/ollama

# Copy only the model (not build artifacts)
COPY --from=builder /root/.ollama/models /root/.ollama/models

# Configure server
ENV OLLAMA_HOST 0.0.0.0
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve"]
