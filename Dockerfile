# Use an official Debian image as a base
FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    g++ \
    make \
    libzip-dev \
    p7zip-full \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy the source code into the container
COPY . .

# Build the project
RUN make

# Set the entry point to the compiled executable
ENTRYPOINT ["./3mf2stl"]