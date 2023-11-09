# sudo certbot --nginx -d alt-r.world -d www.alt-r.world -d api.alt-r.world -d python-base-api.alt-r.world -d teacher.alt-r.world -d teacher-v2.alt-r.world -d python-base-api.alt-r.world -d python-base-api-wss.alt-r.world

sudo docker-compose -f certbot.yml run certbot certonly -d realtorstat.com -d *.realtorstat.com -d *.dreampotential.org -d dreampotential.org -d *.agentstat.com -d agentstat.com -d *.meylordrive.today -d meylordrive.today --manual --preferred-challenges dns

