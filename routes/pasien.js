var express = require('express');
var router = express.Router();
var request = require('request');
var rp = require('request-promise');
var fetch = require('node-fetch');
var Pasien = require('../models/Pasien');
var Poli = require('../models/Poli');
var Dokter = require('../models/Dokter');

// API
router.get('/api/:id?',function(req, res, next){
    if(req.params.id){
        Pasien.getPasienById(req.params.id, function(err,rows){
            if(err)
            {
                res.json(err);
            }
            else{
                if (rows < 1) {
                    res.json({status:false, message:"Gagal", data:rows});
                } else {
                    res.json({status:true, message:"Berhasil", data:rows[0]});
                }
            }
        });
    }
    else{
        Pasien.getAllPasien(function(err, rows){
            if(err)
            {
                res.json({status:false, message:"Gagal", data:err});
            }
            else
            {
                res.json({status:true, message:"Berhasil", data:rows});
            }
     
        });
    }
});

router.post('/api/',function(req, res, next){
    Pasien.addPasien(req.body, function(err, count){
        //console.log(req.body);
        if(err)
        {
            res.json(err);
        }
        else{
            res.json(req.body);//or return count for 1 & 0
        }
    });
});

router.post('/:id',function(req, res, next){
    Pasien.deleteAll(req.body, function(err, count){
        if(err)
        {
          res.json(err);
        }
        else{
          res.json(count);
        }
    });
})

router.delete('/api/:id',function(req, res, next){
    Pasien.deletePasien(req.params.id, function(err, count){
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(count);
        }

    });
});

router.put('/api/:id',function(req,res,next){
    Pasien.updatePasien(req.params.id, req.body, function(err, rows){
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(rows);
        }
    });
});

// end API


var url = 'http://localhost:3000/poli/api';

// view
router.get('/', function(req, res, next) {
    request(url, function(error, response, body) {
        // var data_poli = new Array();
        var data = JSON.parse(body);
        // res.json(data);
        res.render('poli', { title: 'Daftar Pasien', result: data.data});
    }); 
});

router.get('/detail/:id', function(req, res, next) {
    Dokter.getDokterByIdPasien(req.params.id, function(err,rows){
        res.json(rows);
    });
});

module.exports=router;