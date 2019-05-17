var collectionList = db.getCollectionNames();
for(var index in collectionList){
    var collection = collectionList[index];
		var cur = db.getCollection(collection).getIndexKeys();
		if(cur.length == 1){
			continue;
		}
		for(var index1 in cur){
			var next = cur[index1];
			if(next["_id"] == '1'){
				continue;
			}
       print("try{ db.getCollection(\""+collection+"\").ensureIndex("+JSON.stringify(next)+",{background:1})}catch(e){print(e)}");
		}
	}
