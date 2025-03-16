# Railway-Ticket-Reservation-API
Railway Ticket Reservation API (Django + DRF + Postgresql)

Clone Git
----------
git clone https://github.com/Rayeesac/Railway-Ticket-Reservation-API.git

Run Docker 
----------
cd Railway-Ticket-Reservation-API/ && docker-compose -f docker-compose.yml up -d --build

Restore Database
---------
cat railway_reserve_db.sql | docker exec -i railway_postgres psql -U postgres

Down and Up Docker
--------
cd ../ && docker-compose -f docker-compose.yml down && docker-compose -f docker-compose.yml up -d

Postman Collection
--------
[![Download Postman Collection](https://run.pstmn.io/button.svg)](https://github.com/Rayeesac/Railway-Ticket-Reservation-API/Railway Reservation API.postman_collection.json)


Site Available URL: 
-------------------
http://127.0.0.1:8000/api-auth/login/

username : railyway_admin
password : RaWa@Admin123#