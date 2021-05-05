vcl 4.0;


backend default {
  .host = "web:80";
}

sub vcl_recv {
	set req.http.x-clientip = client.ip;
	set req.http.x-serverip = server.ip;
	set req.http.x-localip = local.ip;
	set req.http.x-remoteip = remote.ip;
	return(pass);
}
