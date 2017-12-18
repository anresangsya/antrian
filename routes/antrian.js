var express = require('express');
var router = express.Router();
var db = require('../dbconnection');

router.get('/dokter', function(req, res, next) {
  db.query("SELECT * FROM antrian_dokter WHERE id_antrian = (SELECT MAX(id_antrian) FROM antrian_dokter)", function(error, results, fields) {
  	if (error) {
  		res.json(error);
  	}else {
  		res.send({
          "status":true,
          "data" : results[0]
        });
  	};
  });
});

router.post('/dokter/ambilantrian', function(req, res, next) {
	var timeStamp = new Date().toISOString().slice(0, 19).replace('T', ' ');
	var id_dokter =  req.body.id_dokter,
		id_pasien = req.body.id_pasien,
		no_antrian = req.body.no_antrian;

	db.query("INSERT INTO antrian_dokter (id_dokter, id_pasien, no_antrian) VALUES(?, ?, ?)",
		[id_dokter, id_pasien, no_antrian], function(error, results, fields) {
			if(error){
			    res.send({
			      "status": false,
			      "failed":"error ocurred",
			      "message": error
			    });
			} else {
				res.send({
			      "status": true,
			      "success":"nomor antrian "+no_antrian+" berhasil di pesan"
			    });
			}
		});
});

module.exports = router;