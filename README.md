## Task 1: Backup and encrypt files in home dir

> Необходимо создать bash-скрипт, который будет бэкапить все файлы с кодом, которые лежат не выше домашнего каталога текущего пользователя, а затем шифровать полученный бэкап (алгоритм не имеет значения).

Run: `./backup_and_encrypt.sh <dir_for_search> <archive_name> <extension_1>[, <extension_2, ..., <extension_n>]`

Example: `./backup_and_encrypt.sh ~/kek backup_kek_dir txt py cpp`

To decrypt: `openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -d -in <archieve_name>.tar.enc -out <archieve_name>.tar`

Warning! `archive_name` will be removed if it already exists
