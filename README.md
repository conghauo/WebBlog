Enviroment: 
        Ubuntu 20.04
	PHP 7.4.3 + laravel + composer 
	go 1.18
	mysql 
	nginx.
	
Setup step:
	Coppy Blog to /var/www/html/disscussion
	Coppy WebGameBackend to /var/www/html/WebGame
	run sudo chown -R www-data:www-dat  /var/www/html
	run sudo chmod -R 755 		 /var/www/html
Setup host nginx
	copy file in folder confignginx/config to /etc/nginx
        copy file in confignginx to /etc/nginx/sites-available
	run sudo ln /etc/nginx/sites-available/*  /etc/nginx/sites-enable
	run sudo nginx -t
	run sudo service nginx restart


Command optimize file:
reduce size file image:  sudo mogrify -resize 50% -quality 50 *.png && sudo pngquant *.png --ext .png --force

Install and setup fail2ban.

CREATE USER 'flarumuser'@'localhost' IDENTIFIED BY '123456test';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'flarumuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

Download command:
curl -L -o WebGame.zip "https://drive.google.com/uc?export=download&id=1O5sJqCv2Otb6yDXrm_DtJem1iXOV0Pye?alt=media"

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=FILEID" -O FILENAME && rm -rf /tmp/cookies.txt