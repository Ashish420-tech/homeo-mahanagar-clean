# Step 1: Use official Python image
FROM python:3.13-slim

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy all project files into container
COPY . .

# Step 5: Expose Flask port
EXPOSE 5000

# Step 6: Run Flask app
CMD ["python", "app.py"]