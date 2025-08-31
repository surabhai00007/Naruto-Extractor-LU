FROM python:3.12.1

# Set work directory
WORKDIR /app

# Copy all files
COPY . .

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r master.txt

# Start processes (runtime par hi chalega)
CMD ["bash", "-c", "python3 serverV1.py & python3 main.py"]