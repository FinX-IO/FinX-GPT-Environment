# FinX-GPT-Environment

An Off-the-Shelf Auto-GPT environment, ready configured with the FinX Auto-GPT plugin.

### This repository is intended to get you up and running with Auto-GPT and the FinX Auto-GPT plugin as quickly as possible.

#### The code in this repository will spool up 2 containers upon startup:

1. Redis Container

    The Redis container is a permanent service that is used by Auto-GPT to store data. There may be only one of these running at any time.

2. Auto-GPT Container

    The Auto-GPT container is intended to be run as a single AI-Agent Instance (it is not a permanent service). You may spool up as many of these as you like, if you need Agents to interact with each other.

#### When you run an Auto-GPT Agent, it will be run inside the Auto-GPT container.

#### Files created by the Auto-GPT Agent in your container will be placed in the '~/Auto-GPT/auto_gpt_workspace' director

## How to run the FinX-GPT-Environment

### Pre-Requisites

#### You must have Docker and Docker Compose running and configured on your machine.

### Installation and Usage

1. Clone this repository to your local machine

    ```bash
    git clone git@github.com:FinX-IO/FinX-GPT-Environment.git
    ```
   
2. Change directory to the cloned repository

    ```bash
    cd ~/FinX-GPT-Environment
    ```
   
3. Create a file called FinX.env and populate it with your FinX API Key and FinX Registered Email. The file should be located in '~/FinX-GPT-Environment/FinX.env'

    ```bash
    echo "FINX_API_KEY={my_finx_api_key}" > FinX.env
    echo "FINX_REGISTERED_EMAIL={my_finx_registered_email}" >> FinX.env
    echo "FINX_WORKSPACE={my_finx_workspace_path_relative_to_Auto-GPT_workspace}" >> FinX.env
    ```
   
4. Run the docker-compose up command in headless mode (spools up a Redis container named 'redis-finx')

    ```bash
    sudo docker-compose up -d
    ```
   
5. Run the application startup script RUN_FINX_GPT.sh to start a single Auto-GPT container named 'finx-gpt'

    ```bash
    ./RUN_FINX_GPT.sh finx-gpt
    ```
   note that if you want to run a second container then just choose a container name other than 'finx-gpt'

   The script will start an Agent instance at the command prompt for you to use.

