# Use an official Python runtime as the base image
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt ./

# Install the application dependencies
RUN pip install --no-cache-dir -r requirements.txt -v

# Copy the application code to the container
COPY . .

COPY ./entrypoint.sh  /

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
# Specify the command to run when the container starts
#CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000" ]