var db=require('../dbconnection');

	
var timeStamp = new Date().toISOString().slice(0, 19).replace('T', ' ');

var Dokter = {

	getAllDokter:function(callback){
		return db.query("SELECT * FROM dokter", callback);
	},

	getDokterById:function(id, callback){
	    return db.query("SELECT * FROM dokter where id_dokter=?", [id], callback);
	},

	addDokter:function(Dokter, callback){
		console.log("inside service");
		console.log(Dokter.id_dokter);
		return db.query("INSERT INTO dokter VALUES(?, ?, ?, ?, ?, ?, ?)",
			[Dokter.id_dokter, Dokter.nama_dokter, Dokter.jk, Dokter.tgl_lahir, Dokter.id_poli, timeStamp, timeStamp], callback);
	},
	deleteDokter:function(id, callback){
	    return db.query("DELETE FROM dokter WHERE id_dokter=?", [id], callback);
	},
	updateDokter:function(id, Dokter, callback){
	    return db.query("UPDATE dokter SET nama_dokter=?, jk=?, tgl_lahir=?, id_poli=? where id_dokter=?",
	    	[Dokter.nama_dokter, Dokter.jk, Dokter.tgl_lahir, Dokter.id_poli, id], callback);
	},
	deleteAll:function(item, callback){

	var delArr=[];
	   for(i=0;i<item.length;i++){

	       delArr[i]=item[i].Id;
	   }
	   return db.query("DELETE FROM dokter where id_dokter in (?)", [delArr],callback);
	}
};
module.exports=Dokter;