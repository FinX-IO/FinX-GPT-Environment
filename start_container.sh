cat ./FinX.env >> ./BaseConfig.env
sudo docker scripts/run -it --env-file=./BaseConfig.env --network='autogpt-network' -v $PWD/auto_gpt_workspace:/home/appuser/auto_gpt_workspace autogpt
