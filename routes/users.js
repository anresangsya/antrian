var express = require('express');
var router = express.Router();
var db = require('../dbconnection');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.post('/login', function(req, res, next) {
	var email = req.body.email,
		password = req.body.password;

	db.query("SELECT u.*, p.id_pasien, p.nama_pasien, p.tgl_lahir, p.jk, p.telepon, p.alamat, p.bpjs FROM users u LEFT JOIN pasien p ON u.email=p.email WHERE u.email=?", [email], function(error, results, fields) {
		if(error){
			res.send({
		      "status" : 400,
		      "message" : "Error ocurred"
		    });
		} else {
			if(results.length > 0){
		      	if(results[0].password == password){
			        res.send({
			          "status":200,
			          "message":"login sucessfull",
			          "data" : results[0]
			        });
		      	} else {
		      		res.send({
			          "status":201,
			          "message":"Email and password does not match",
			          "data" : {}
			        });
		      	}
		  	} else{
		  		res.send({
			        "status":202,
			        "message":"Email does not exits",
			        "data" : {}
			     });
			}
		}
	});
});

router.post('/register', function(req, res, next) {
	var timeStamp = new Date().toISOString().slice(0, 19).replace('T', ' ');
	var email =  req.body.email,
		password = req.body.password,
		role = req.body.role,
		id_pasien = req.body.id_pasien,	
		tgl_lahir = req.body.tgl_lahir,
		jk = req.body.jk,
		telepon = req.body.telepon,
		alamat = req.body.alamat,
		bpjs = req.body.bpjs;
		

	db.query("INSERT INTO users (email, password, role) VALUES(?, ?, ?)",
		[email, password, role], function(error, results, fields) {
			if(error){
			    res.send({
			      "code":400,
			      "failed":"error ocurred"
			    });
			} else {
				res.send({
			      "code":200,
			      "success":"user registered sucessfully"
			    });
			}
		});
});

router.post('/api/login', function(req, res, next) {
	var email = req.body.email,
		password = req.body.password;

	db.query("SELECT * FROM users WHERE email=?", [email], function(error, results, fields) {
		if(error){
			res.send({
		      "status" : 400,
		      "message" : "Error ocurred"
		    });
		} else {
			if(results.length > 0){
		      	if(results[0].password == password){
			        
		      		if (results[0].role == 2) {
			        	res.redirect('/dokter/dashboard/'+ results[0].email);
			        } else if (results[0].role == 3) {
			        	res.send({
					        "message":"apoteker"
					     });
			        }
		      	
		      	} else {
		      		res.send({
			          "status":201,
			          "message":"Email and password does not match",
			          "data" : {}
			        });
		      	}
		  	} else{
		  		res.send({
			        "status":202,
			        "message":"Email does not exits",
			        "data" : {}
			     });
			}
		}
	});
});

module.exports = router;
