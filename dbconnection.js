var mysql=require('mysql');
var connection=mysql.createPool({

host:'localhost',
user:'root',
password:'akulali',
database:'antrian'


});

module.exports=connection;