# Use an official Python base image from the Docker Hub
FROM python:3.10-slim

# Install git
RUN apt-get -y update
RUN apt-get -y install git chromium-driver

# Install Xvfb and other dependencies for headless browser testing
RUN apt-get update \
    && apt-get install -y wget gnupg2 libgtk-3-0 libdbus-glib-1-2 dbus-x11 xvfb ca-certificates

# Install Firefox / Chromium
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y chromium firefox-esr \
    && apt-get install -y unzip \
    && apt-get install -y pip

# Set environment variables
ENV PIP_NO_CACHE_DIR=yes \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Create a non-root user and set permissions
RUN useradd --create-home appuser
WORKDIR /home/appuser
RUN chown appuser:appuser /home/appuser
USER appuser

# Copy the requirements.txt file and install the requirements
COPY --chown=appuser:appuser requirements.txt .
RUN sed -i '/Items below this point will not be included in the Docker Image/,$d' requirements.txt && \
	python3 -m pip install --no-cache-dir --user -r requirements.txt

## Copy the application files
#COPY --chown=appuser:appuser autogpt/ ./autogpt
#
## Copy the plugin files
#COPY --chown=appuser:appuser plugins/ ./plugins
#
RUN cd /home/appuser
RUN python3 -m pip install --upgrade pip
RUN wget 'https://github.com/Significant-Gravitas/Auto-GPT/archive/refs/heads/master.zip' -O /home/appuser/Auto-GPT.zip
RUN unzip /home/appuser/Auto-GPT.zip -d /home/appuser/
RUN mkdir /home/appuser/Auto-GPT-master/autogpt/plugins
WORKDIR /home/appuser/Auto-GPT-master
COPY my-auto-gpt-env.txt /home/appuser/Auto-GPT-master/.env
COPY plugins/Finxgpt.zip /home/appuser/Auto-GPT-master/plugins/Finxgpt.zip

# Set the entrypoint
ENTRYPOINT ["python", "-m", "autogpt"]
