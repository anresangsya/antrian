var express = require('express');
var router = express.Router();
var Poli = require('../models/Poli');

// API
router.get('/api/:id?',function(req, res, next){
    if(req.params.id){
        Poli.getPoliById(req.params.id, function(err,rows){
            if(err)
            {
                res.json(err);
            }
            else{
                res.json(rows);
                // res.json({success:true, message:"Berhasil", data:rows});
            }
        });
    }
    else{
        Poli.getAllPoli(function(err, rows){
            if(err)
            {
                res.json(err);
            }
            else
            {
                res.json(rows);
            }
     
        });
    }
});

router.post('/api/',function(req, res, next){
    Poli.addPoli(req.body, function(err, count){
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
    Poli.deleteAll(req.body, function(err, count){
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
    Poli.deletePoli(req.params.id, function(err, count){
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
    Poli.updatePoli(req.params.id, req.body, function(err, rows){
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


var url = 'localhost:3000/poli/api';

// view
router.get('/', function(req, res, next) {
  res.render('poli', { title: 'Poli' });
});


module.exports=router;