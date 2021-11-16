# Using Linux Alpine version 3.14
FROM alpine:3.14

# Update package list
RUN apk update 

# Install Texlive-full and Pygments packages
RUN apk add texlive-full py3-pygments

# Create non-root user
RUN addgroup -S texgroup && adduser -S texuser -G texgroup
USER texuser

# Define working directory
WORKDIR /home/texuser