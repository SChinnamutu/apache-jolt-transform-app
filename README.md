Example Spring Boot MVC Application
===================================



Requirements
------------
* [Java Platform (JDK) 7](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Apache Maven 3.x](http://maven.apache.org/)

Quick start
-----------

Clone the project and unzip project and place it in folder.
Go inside project folder.

1. `mvn clean install -DskipTests`
2. `java -jar target/keybank-jolt-transform-app-1.0-SNAPSHOT.jar`
3. Point your browser to [http://localhost:8090/jolt/]

Sample InputJson:

[
   {
      "uuid":"cac40601-ffc9-4fd0-c5a1-772ac65f0587",
      "pageId":123456,
      "location":"Berlin",
      "maxParticipants":10,
      "page":{
         "indexable":true,
         "rootLevel":false,
         "homePage":false,
         "latestVersion":true,
         "current":true,
         "deleted":false,
         "draft":false,
         "unpublished":false,
         "versionCommentAvailable":false,
         "persistent":true,
         "new":false
      },
      "date":"15.02.17",
      "startTime":"09:00",
      "endTime":"16:30",
      "start":1487145600000,
      "end":1487172600000,
      "hasStartTime":true,
      "hasEndTime":true,
      "eventPageUrl":"/some/url",
      "categories":[
         {
            "label":"Test",
            "id":123,
            "belongsToEvents":true
         }
      ],
      "participants":[  
 
      ],
      "isCurrentUserParticipating":false,
      "fullTitle":"Test Page"
   }
]

Sample SpecJson:

[
    {
        "operation": "remove",
        "spec":    {
          "*": {
           "page":"",
           "date":"",
           "startTime":"",
           "endTime":""
         }
        }
    }
]

Click on Transform button:

OutputJson:

[ {
  "uuid" : "cac40601-ffc9-4fd0-c5a1-772ac65f0587",
  "pageId" : 123456,
  "location" : "Berlin",
  "maxParticipants" : 10,
  "start" : 1487145600000,
  "end" : 1487172600000,
  "hasStartTime" : true,
  "hasEndTime" : true,
  "eventPageUrl" : "/some/url",
  "categories" : [ {
    "label" : "Test",
    "id" : 123,
    "belongsToEvents" : true
  } ],
  "participants" : [ ],
  "isCurrentUserParticipating" : false,
  "fullTitle" : "Test Page"
} ]
