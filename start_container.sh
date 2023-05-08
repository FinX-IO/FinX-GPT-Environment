sudo docker image build -t autogpt .
alias python=python3
cat ./FinX.env >> ./BaseConfig.env
cp ./BaseConfig.env ./.env
cd ~/FinX-GPT-Environment
bash run.sh --install-plugin-deps
sudo docker run -it --env-file=./.env --network='autogpt-network' -v $PWD/auto_gpt_workspace:/home/appuser/auto_gpt_workspace autogpt
