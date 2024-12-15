FROM whanos-python

# Using bash shell
SHELL ["/bin/bash", "-c"]

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any needed packages specified in requirements.txt
RUN python -m venv venv

# Use the package installer from the virtual environment
RUN /bin/bash -c "source venv/bin/activate && pip install --no-cache-dir -r requirements.txt"

# Make sure the virtual environment is activated
ENV PATH="/app/venv/bin:$PATH"

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run app.py when the container launches
CMD ["python3", "-m", "app"]

# docker build -t python-standalone -f images/python/Dockerfile.standalone App_example_sta/python-hello-world/.
# docker run -it --rm python-standalone