var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "ehandy",
  password: "jayden",
  database: "eHandy"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM Homeowner", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});