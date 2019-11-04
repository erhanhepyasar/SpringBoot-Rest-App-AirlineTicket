FROM java:8
ADD /target/airline-ticket.jar airline-ticket.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","airline-ticket.jar"]