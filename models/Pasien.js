var db=require('../dbconnection');

	
var timeStamp = new Date().toISOString().slice(0, 19).replace('T', ' ');

var Pasien = {

	getAllPasien:function(callback){
		return db.query("SELECT * FROM pasien ORDER BY nama_pasien", callback);
	},

	getPasienById:function(id, callback){
	    return db.query("SELECT * FROM pasien where id_pasien=?", [id], callback);
	},
	deletePasien:function(id, callback){
	    return db.query("DELETE FROM pasien WHERE id_pasien=?", [id], callback);
	},
	deleteAll:function(item, callback){

	var delArr=[];
	   for(i=0;i<item.length;i++){

	       delArr[i]=item[i].Id;
	   }
	   return db.query("DELETE FROM pasien where id_pasien in (?)", [delArr],callback);
	}
};
module.exports=Pasien;