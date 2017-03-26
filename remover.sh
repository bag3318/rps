#!/bin/sh

master() {

	# Text Emphasis
	normal=$(tput sgr0);      # Select normal mode
	bold=`tput bold`;         # Select bold mode
	nonbold=`tput sgr0` 	  # Select non-bold mode
	underline=`tput smul`;    # Select underline mode
	nonunderline=`tput rmul`; # Select non-underline mode

	echo_statement() {
		echo ${bold}Would you like to remove the RPS Ruby app?${nonbold};
	}
	echo_statement;
	process() {
		sudo rm -r /usr/local/bin/rps;
		cd ~/Desktop/rps;
		cd ~/Desktop/rps-master;
		mv rps rps-mac.rb;
	}
	confirmation() {
		echo ${bold}Press ${underline}R${nonunderline} to ${underline}remove${nonunderline} it, or press ${underline}K${nonunderline} to ${underline}keep${nonunderline} it.${nonbold};
		while read -r -n 1 -s answer; do
			if [[ $answer = [RrKk] ]]; then
			    [[ $answer = [Rr] ]] && retval=0;
			    [[ $answer = [Kk] ]] && retval=1;
			    break;
			fi;
		done;
		return $retval;
	}
	init() {
		if confirmation; then
			process;
		else
			echo ${bold}K, bye${nonbold};
		fi;
	}
	init;
}
master;

