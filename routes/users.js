var express = require('express');
var router = express.Router();
var db = require('../dbconnection');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.post('/login', function(req, res, next) {
	var email = req.body.email;
	var password = req.body.password;

	db.query("SELECT * FROM users WHERE email=?", [email], function(error, results, fields) {
		if(error){
			res.send({
		      "status" : 400,
		      "message" : "Gagal login"
		    });
		} else {
			if(results.length > 0){
		      	if(results[0].password == password){
			        res.send({
			          "status":200,
			          "message":"login sucessfull"
			        });
		      	} else {
		      		res.send({
			          "status":204,
			          "message":"Email and password does not match"
			        });
		      	}
		  	} else{
		  		res.send({
			        "status":204,
			        "message":"Email does not exits"
			     });
			}
		}
	});
});

module.exports = router;
