server {
	listen 80;
	listen [::]:80;

	root /var/www;

	index index.html;

	location / {
		try_files $uri $uri/ =404;
	}

	location /about {
		try_files /about.html =404;
	}
}
