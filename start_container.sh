sudo docker build -t autogpt .
cat ./FinX.env >> ./BaseConfig.env
sudo docker run -it --env-file=./BaseConfig.env --network='autogpt-network' -v $PWD/auto_gpt_workspace:/home/appuser/auto_gpt_workspace autogpt
