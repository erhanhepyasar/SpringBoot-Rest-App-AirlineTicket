﻿# SpringBoot-Rest-App-AirlineTicket

Technologies: 
-	Java 8, 
-	Spring Boot, 
-	Maven, 
-	JPA-Hibernate, 
-	MySQL, 
-	Restful WebService (Json), 
-	Swagger, 
-	Lombok (To avoid boiler plate codes like getter, setter, constructor, toString. etc.),
-	Docker
Back-end services:
-	Add, remove, update, delete, get, get all airport company
-	Add, remove, update, delete, get, get all airport
-	Add, remove, update, delete, get, get all flight
-	Add, remove, update, delete, get, get all plane
-	Add, remove, update, delete, get, get all route
-	Add, remove, update, delete, get, get all ticket
-	Buy ticket, search by ticket code, Cancel Ticket
-	Increase ticket price by %10 depending on the increase in flight quotes by %10, %20, %30 …

Documentation (Swagger):  http://localhost:8082/swagger-ui.html

Request Examples (JSON) :

Create Airport
Request:
POST: localhost:8082/api/airport
Body:
{
	"name": "Ataturk Airport",
	"capacity": 100,
	"location": "Istanbul-Avrupa"
}

Response:
Status: 200 – OK
Body:
{
    "id": 5,
    "name": "3. Havaalani",
    "capacity": 500,
    "location": "Istanbul-Avrupa",
    "departureRoutes": null,
    "arrivalRoutes": null
}

Get Airport By Id
Request:
GET: localhost:8082/api/airport/1

Response:
Status: 200 – OK
Body:
{
    "id": 1,
    "name": "Sabiha Gokcen",
    "capacity": 1000,
    "location": "Istanbul-Asya",
    "departureRoutes": [],
    "arrivalRoutes": [],
    "hibernateLazyInitializer": {}
}


Get All Airports
Request:
GET: localhost:8082/api/airport

Response:
Status: 200 – OK
Body:
[
    {
        "id": 1,
        "name": "Sabiha Gokcen Airport",
        "capacity": 1000,
        "location": "Istanbul-Asya",
        "departureRoutes": [],
        "arrivalRoutes": []
    },
    {
        "id": 2,
        "name": "Ataturk Airport",
        "capacity": 100,
        "location": "Istanbul-Avrupa",
        "departureRoutes": [],
        "arrivalRoutes": []
    }
]

Delete Airport
Request:
DELETE: localhost:8082/api/airport/2

Response: 
Status: 200 – OK


Docker Commands:
Create application .jar file (airline-ticker-jar):
…\AirlineTicketApp>mvn clean
…\AirlineTicketApp>mvn package
Create docker image:
…\AirlineTicketApp> docker build -f Dockerfile -t airline-ticket .
List docker images:
…\AirlineTicketApp> docker images
	Repository	size
-	airline-ticket	685MB

Create & Run docker image for MySql database:
…\AirlineTicketApp> docker run -d -p 6033:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=root" --env="MYSQL_PASSWORD=admin" --env="MYSQL_DATABASE=ticketdb" mysql
Run image for Airline Ticket application:
…\AirlineTicketApp> docker run -p 8082:8082 airline-ticket
…\AirlineTicketApp> docker run –link docker-mysql:mysql -p 8082:8082 airline-ticket


Get docker-machine IP
…\AirlineTicketApp> docker-machine ls
