#!/bin/bash
SESSION=$USER
if ! [[ $1 =~ ^[0-9]{4}-(0[0-9]|1[0-2])-([0-2][0-9]|3[0-1])$ ]]; then
	echo 'plz give a bussiness date YYYY-MM-DD'
	exit
fi
# bash date
bdate=$(echo $1 | sed 's/-//g')
echo "STARTING THE SYSTEM ON $bdate ..."
tmux -2 new-session -d -s $SESSION

# Setup a window for tailing log files
# tmux new-window -t $SESSION:1 -n 'working'
tmux split-window -h
tmux send-keys "cd && cd ./trade-envs/129/dv/md-next2/ && ./start_md.sh" C-m
tmux send-keys 'cd ./logs && tail -f $(ls -rt | tail -1)' C-m
tmux split-window -v
tmux send-keys "cd && cd ./trade-envs/129/dv/oe-next2/ && ./start_oe.sh -d $bdate" C-m
tmux send-keys 'cd ./logs && tail -f $(ls -rt | tail -1)' C-m

sleep 5 
tmux selectp -t 0
tmux send-keys "cd && cd ./git-repos/afoss_dev01.2/ && ./start_afoss.sh $1" C-m

sleep 10 
tmux selectp -t 0
tmux send-keys "cd && cd ./trade-envs/129/dv/md-next2/ && ./send_cmd.sh start_mds" C-m

# Attach to session
tmux -2 attach-session -t $SESSION
