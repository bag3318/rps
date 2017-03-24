#!/bin/bash

master() {

	# Text Emphasis
	normal=$(tput sgr0);      # Select normal mode
	bold=`tput bold`;         # Select bold mode
	nonbold=`tput sgr0` 	  # Select non-bold mode
	underline=`tput smul`;    # Select underline mode
	nonunderline=`tput rmul`; # Select non-underline mode

	echo_statement() {
		echo ${bold}Would you like to make the ${underline}rps_mac.rb${nonunderline} an executable ruby file?${nonbold};
	}
	echo_statement;

	process() {
		cd ~/Desktop/rps;
		cd ~/Desktop/rbs-master;
		chmod 755 rps_mac.rb;
		mv rps_mac.rb rps_mac;
		echo $PATH;
		mkdir -p /usr/local/bin/;
		ln -s $PWD/rps_mac /usr/local/bin/;
	}

	confirm() {
		echo ${bold}Press ${underline}C${nonunderline} to ${underline}continue${nonunderline}, or press ${underline}Q${nonunderline} to ${underline}quit${nonunderline}.${nonbold};
		while read -r -n 1 -s answer; do
			if [[ $answer = [CcQq] ]]; then
			    [[ $answer = [Cc] ]] && retval=0;
			    [[ $answer = [Qq] ]] && retval=1;
			    break;
			fi;
		done;
		return $retval;
	}

	init() {
		if confirm; then
			process;
		else
			echo ${bold}Bye!${nonbold};
		fi;
	}
	init;
}

master;
