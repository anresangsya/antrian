var db=require('../dbconnection');

	
var timeStamp = new Date().toISOString().slice(0, 19).replace('T', ' ');

var Dokter = {

	getAllDokter:function(callback){
		return db.query("SELECT * FROM dokter LEFT JOIN poli ON dokter.id_poli=poli.id_poli", callback);	
		// return db.query("SELECT d.id_dokter, d.id_poli, p.nama_poli FROM dokter d LEFT JOIN poli p ON d.id_poli=p.id_poli", callback);

	},

	getDokterById:function(id, callback){
	    return db.query("SELECT * FROM dokter LEFT JOIN poli ON dokter.id_poli=poli.id_poli where dokter.id_dokter=?", [id], callback);
	},

	getDokterByIdPoli:function(id, callback){
	    return db.query("SELECT * FROM dokter LEFT JOIN poli ON dokter.id_poli=poli.id_poli where dokter.id_poli=?", [id], callback);
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