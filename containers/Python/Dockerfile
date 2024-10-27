
FROM python:3.10

# Set the working directory
WORKDIR /usr/src/app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the Python script
COPY crypto_ingest.py .

# Install dbt and dbt-postgres adapter
RUN pip install dbt-postgres



#RUN cd dbt




CMD ["bash", "-c", "python crypto_ingest.py && cd dbt && dbt run"]