# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY recthink_web.py .
COPY recursive_thinking_ai.py .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=recthink_web.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run recthink_web.py when the container launches
# Use Flask's built-in server for development. For production, consider Gunicorn.
CMD ["flask", "run"]