# Crypto Data Engineering Pipeline

This project demonstrates a simple end-to-end data engineering pipeline for ingesting cryptocurrency data from an external API, storing it in a PostgreSQL database, transforming it using dbt, and visualizing the data with Grafana. The pipeline is containerized using Docker Compose, ensuring that all components are easy to deploy and manage.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
  - [Pre-requisites](#pre-requisites)
  - [Running the Project](#running-the-project)
- [Usage](#usage)
  - [Ingesting Data](#ingesting-data)
  - [Running dbt Transformations](#running-dbt-transformations)
  - [Visualizing Data in Grafana](#visualizing-data-in-grafana)
- [Contributing](#contributing)
- [License](#license)

## Overview

The purpose of this project is to provide a hands-on implementation of a data engineering pipeline. It ingests cryptocurrency data from an external API, stores the raw data in PostgreSQL, transforms the data using dbt, and provides insights through a Grafana dashboard.

### Features
- **Ingestion**: Collects real-time cryptocurrency data from a public API (e.g., CoinGecko).
- **Data Storage**: Stores raw data in a PostgreSQL database.
- **Transformation**: Cleans and transforms the raw data using dbt.
- **Visualization**: Uses Grafana to create real-time dashboards for visualizing cryptocurrency trends.
- **Docker Compose**: Simplifies deployment by containerizing the services.

## Tech Stack

- **Python**: For data ingestion and scripting.
- **PostgreSQL**: For storing raw and transformed data.
- **dbt**: For data transformation and modeling.
- **Grafana**: For visualizing the transformed data.
- **Docker Compose**: For managing containerized services.

## Project Structure

```bash
crypto-data-pipeline/
│
├── crypto_ingest.py          # Python script for ingesting crypto data from API
├── Dockerfile                # Dockerfile for building the Python environment
├── docker-compose.yml        # Docker Compose file for running services
├── dbt_project/              # dbt project folder containing transformations
│   ├── models/               # dbt models (SQL transformation files)
│   └── dbt_project.yml       # dbt configuration
├── grafana/                  # Grafana configuration and dashboard files
└── README.md                 # Project documentation
```

## Setup Instructions

### Pre-requisites

- Docker and Docker Compose installed on your machine
- GitHub account with a repository to store this project

### Running the Project

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/crypto-data-pipeline.git
    cd crypto-data-pipeline
    ```

2. **Build and run the services using Docker Compose**:

    ```bash
    docker-compose up 
    ```


