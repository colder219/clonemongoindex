var dbs = db.adminCommand('listDatabases')
var dbs=dbs.databases
var cars=new Array();
for( db in dbs){
	var aa= dbs[db].name
	if (aa == "local" || aa=="admin")  {
		continue	
	}
	cars.push(aa)
}

print(cars)
