# Use the official Python image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the project files
COPY . /app/

# Expose the correct port for Fly.io
EXPOSE 8080

# Start the Django app
CMD ["gunicorn", "django_project.wsgi:application", "--bind", "0.0.0.0:8080"]

