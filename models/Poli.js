var db=require('../dbconnection');

	
var timeStamp = new Date().toISOString().slice(0, 19).replace('T', ' ');

var Poli = {

	getAllPoli:function(callback){
		return db.query("SELECT * FROM poli", callback);
	},

	getPoliById:function(id, callback){
	    return db.query("SELECT * FROM poli where id_poli=?", [id], callback);
	},

	addPoli:function(Poli, callback){
		console.log("inside service");
		console.log(Poli.id_poli);
		return db.query("INSERT INTO poli VALUES(?, ?, ?, ?, ?, ?, ?)",
			[Poli.id_poli, Poli.nama_poli, Poli.jk, Poli.tgl_lahir, Poli.id_poli, timeStamp, timeStamp], callback);
	},
	deletePoli:function(id, callback){
	    return db.query("DELETE FROM poli WHERE id_poli=?", [id], callback);
	},
	updatePoli:function(id, Poli, callback){
	    return db.query("UPDATE poli SET nama_poli=?, jk=?, tgl_lahir=?, id_poli=? where id_poli=?",
	    	[Poli.nama_poli, Poli.jk, Poli.tgl_lahir, Poli.id_poli, id], callback);
	},
	deleteAll:function(item, callback){

	var delArr=[];
	   for(i=0;i<item.length;i++){

	       delArr[i]=item[i].Id;
	   }
	   return db.query("DELETE FROM poli where id_poli in (?)", [delArr],callback);
	}
};
module.exports=Poli;