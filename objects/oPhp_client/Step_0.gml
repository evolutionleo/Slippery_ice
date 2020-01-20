/// @desc
if(global.searching) {
	http_get("http://62.113.112.109/index.php?action=search&name="+global.name+"&range="+global.search_range)
}