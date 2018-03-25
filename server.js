//server requirements

var http = require('http');
var express = require('express');
var app = express();
app.use(express.static("."));
var mysql = require('mysql');

var con = mysql.createConnection({

    //Unsure how to set this for a project like this, with the script given 
    //instead of the sql server being hosted
    //So I just commented it out for now
    //if someone else could set up and initialize the connection that'd be great

    //host: 'localhost',
    //user: /**/,
    //password: /**/,
    //database: /**/

});

con.connect(function (err) {
    if (err) {
        console.log("Error connecting to database");
    }
    else {
        console.log("Database successfully connected");
    }
});

app.get('/', function (req, res) {

    res.sendFile(__dirname + "/FrontEnd/login.html");

});

app.get('/home', function (req, res) {

    res.sendFile(__dirname + "/FrontEnd/home.html");

});

app.get('/AboutUs', function (req, res) {

    res.sendFile(__dirname + "/FrontEnd/aboutUs.html");

});

app.get('/Grades/Announcements', function (req, res) {

    res.send();

});

//starts the server
app.listen(8080, function () { console.log("Server started..."); });