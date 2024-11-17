# Stage 1: Build Stage
FROM python:3.9-slim AS builder

# Set the working directory in the build container
WORKDIR /webapp

# Copy only the requirements file to leverage Docker cache
COPY requirements.txt .

# Install dependencies in the build stage 
RUN apt-get update && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install gunicorn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Stage 2: Runtime Stage
FROM python:3.9-slim

# Set the working directory in the runtime container
WORKDIR /webapp

# Copy the application code from the host
COPY . .

# Copy only necessary parts from the build stage (e.g., dependencies)
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Expose port 8080
EXPOSE 8080

# Run the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]

