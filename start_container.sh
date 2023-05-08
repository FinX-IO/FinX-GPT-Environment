sudo docker image build -t autogpt .
cat ./FinX.env >> ./BaseConfig.env
wget "https://github.com/FinX-IO/Auto-GPT-FinX-Plugin" -O ~/Auto-GPT-FinX-Plugin
cd ~/Auto-GPT-FinX-Plugin
pip install -r requirements.txt
cd ~/FinX-GPT-Environment
zip -r /plugins/FinX.zip ~/Auto-GPT-FinX-Plugin
sudo docker run -it --env-file=./BaseConfig.env --network='autogpt-network' -v $PWD/auto_gpt_workspace:/home/appuser/auto_gpt_workspace autogpt
