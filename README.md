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
docker-compose -f docker-compose.yml down && docker-compose -f docker-compose.yml up -d

📥 Download Postman Collection  
----------------------
[![Download Postman Collection](https://run.pstmn.io/button.svg)](https://www.postman.com/grey-equinox-143107/railway-reservation-api/collection/589ljuf/railway-reservation-api)


📌 API Endpoints Documentation
------------------------------

1.Book a Ticket
--------------------

📍 **Endpoint: POST /api/v1/tickets/book**

Books a railway ticket for a passenger. The system automatically assigns the appropriate berth type based on availability and priority rules.

🔹 Request Body Example (JSON)

```json

{
    "passenger": {
        "name": "Alice Johnson",
        "age": 65,
        "gender": "F",
        "is_child": false
    }
}
```
✅ Response Example (Success)

```json
{
    "id": 12,
    "status": "CONFIRMED",
    "berth_type": "LOWER",
    "passenger": {
        "id": 30,
        "name": "Alice Johnson",
        "age": 65,
        "gender": "F",
        "is_child": false
    }
}
```
❌ Response Example (No Tickets Available)

```json
{
    "error": "No tickets available"
}
```

2.Cancel a Ticket
-------------------

📍 **Endpoint: POST /api/v1/tickets/cancel/{ticketId}**

Cancels a previously booked ticket. If a Confirmed ticket is canceled, the system will upgrade the next RAC ticket to Confirmed, and the next Waitlist ticket to RAC.

🔹 Path Parameter:

ticketId → The unique ID of the ticket to be canceled
✅ Response Example (Success)

```json
{
    "message": "Ticket canceled successfully"
}
```
❌ Response Example (Ticket Not Found)

```json
{
    "error": "Ticket not found"
}
```

3.Get All Booked Tickets
------------------------

📍 **Endpoint: GET /api/v1/tickets/booked**

Retrieves a list of all booked tickets, including details of Confirmed, RAC, and Waitlist passengers.

✅ Response Example

```json
[
    {
        "id": 10,
        "status": "CONFIRMED",
        "berth_type": "LOWER",
        "passenger": {
            "id": 21,
            "name": "John Doe",
            "age": 60,
            "gender": "M",
            "is_child": false
        }
    },
    {
        "id": 11,
        "status": "RAC",
        "berth_type": "SIDE-LOWER",
        "passenger": {
            "id": 22,
            "name": "Jane Doe",
            "age": 40,
            "gender": "F",
            "is_child": false
        }
    }
]
```

4.Get Available Tickets Count
-------------

📍 **Endpoint: GET /api/v1/tickets/available**

Returns the number of available Confirmed, RAC, and Waitlist slots.

✅ Response Example

```json
{
    "confirmed": 10,
    "RAC": 5,
    "waiting": 2
}
```

Site Available URL: 
-------------------
http://127.0.0.1:8000/api-auth/login/

username : railyway_admin
password : RaWa@Admin123#
