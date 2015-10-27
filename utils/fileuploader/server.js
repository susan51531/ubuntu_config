var express = require("express"),
    app = express(),
    path = require('path'),
    fs   = require('fs-extra'),
    Busboy = require('busboy');

app.disable('x-powered-by');
app.use(express.static(__dirname + '/', {
    maxAge: '1d'
}));

app.post('/upload', function(req, res) {
    var busboy = new Busboy({ headers: req.headers });
    busboy.on('file', function(fieldname, file, filename, encoding, mimetype) {
        console.log('File [' + fieldname + ']: filename: ' + filename + ', encoding: ' + encoding + ', mimetype: ' + mimetype);
        file.pipe(fs.createWriteStream(path.join(__dirname, filename)));
        file.on('end', function() {
            console.log('File [' + fieldname + '] Finished');
        });
    });
    busboy.on('finish', function() {
        console.log('Done parsing form!');
        res.writeHead(303, { Connection: 'close', Location: '/' });
        res.end();
    });
    req.pipe(busboy);
});

var indexTmp = ''+
'<!DOCTYPE html>'+
'<html lang="en">'+
'<head>'+
    '<meta charset="UTF-8">'+
    '<title></title>'+
'</head>'+
'<body>'+
   '<form action="upload" method="POST" enctype="multipart/form-data">'+
        '<input type="file" name="tmp" >'+
        '<input type="submit" value="Send">'+
    '</form>'+
'</body>'+
'</html>';

app.get('/', function(req, res){
    res.setHeader('Content-Type', 'text/html');
    res.send(indexTmp);
});

app.listen(8085,function(){
	console.log('Server running at:localhost:8085');
});
