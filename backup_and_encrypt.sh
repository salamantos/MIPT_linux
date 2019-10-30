#!/usr/bin/env bash

if [ $# -ge 3 ]; then
	rm -rf $2 &> /dev/null
	mkdir $2 &> /dev/null
	
	i=0
	for extension in $@; do
		let "i+=1"
		if ((i<=2)); then
			continue
		fi

		find $1 -name "*.$extension" -exec cp --parents {} $2/ \;
	done

	tar -cf $2.tar $2/ &> /dev/null
	openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -in $2.tar -out $2.tar.enc
	rm -rf $2 &> /dev/null
	rm $2.tar &> /dev/null
	echo "done"
else
	printf "Usage: ./backup_and_encrypt.sh <dir_for_search> <archive_name> <extension_1>[, <extension_2, ..., <extension_n>]\nExample: ./backup_and_encrypt.sh ~/kek backup_kek_dir txt py cpp"
fi
