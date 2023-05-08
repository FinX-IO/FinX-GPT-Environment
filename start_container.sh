sudo docker image build -t autogpt .
cat ./FinX.env >> ./BaseConfig.env
wget "https://github.com/FinX-IO/Auto-GPT-FinX-Plugin" -O ~/Auto-GPT-FinX-Plugin
cd ~/Auto-GPT-FinX-Plugin
pip install -r requirements.txt
cd ~/FinX-GPT-Environment/autogpt/plugins
zip -r FinX.zip ~/Auto-GPT-FinX-Plugin
chmod a+rwx FinX.zip
cd ~/FinX-GPT-Environment
sudo docker run -it --env-file=./.env --network='autogpt-network' -v $PWD/auto_gpt_workspace:/home/appuser/auto_gpt_workspace autogpt
