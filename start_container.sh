sudo docker image build .
cat ./FinX.env >> ./BaseConfig.env
sudo docker run -it --env-file=./BaseConfig.env --network='autogpt-network' -v $PWD/auto_gpt_workspace:/home/appuser/auto_gpt_workspace b7973f07b2d7
