var express = require("express");
var mysql = require("mysql");
var url = require("url");
var multer = require ("multer");
var querystring  = require("querystring");
var server = require("http").createServer(app);
var io = require("socket.io")(server);
//实例化express
var app = express();
app.use(express.static('../userlogo'));
// var connection = mysql.createConnection({
// 		host:"localhost",
// 		user:"fecshop",
// 		password:"root",
// 		database:""
// 	});
// connection.connect();

var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post('/login/num', function(req, res) {
	res.append("Access-Control-Allow-Origin","*");
	//console.log(req.body)
	var sql=`SELECT * FROM userinfo where userNum='${req.body.username}'`;
    connection.query(sql, function (error, results, fields) {   
		res.send(results);
    });
});
app.post('/login/phone', function(req, res) {
	res.append("Access-Control-Allow-Origin","*");
	var sql=`SELECT * FROM userinfo where userPhone='${req.body.username}'`;
    connection.query(sql, function (error, results, fields) {  
		res.send(results);
    });
});
app.post('/userreg/isin', function(req, res) {
	res.append("Access-Control-Allow-Origin","*");
	var sql=`SELECT userNum,userPhone FROM userinfo`;
    connection.query(sql, function (error, results, fields) {  
		res.send(results);
    });
});
app.post('/userreg', function(req, res) {
	res.append("Access-Control-Allow-Origin","*");
	var sql=`INSERT INTO userinfo (userNum,userName,userPass,userGender,userPhone,userImg) VALUES ('${req.body.username}','${req.body.usernick}',${req.body.userpass},'${req.body.usergender}','${req.body.userphone}','http://10.40.153.231:88/wechat/userlogo/${req.body.userimg}')`;
    connection.query(sql, function (error, results, fields) {  
		if(error) throw error;
		res.send("1");
    });
});

var storage = multer.diskStorage({
	//存储文件地方
	destination:function(req,res,cb){
		cb(null,"userlogo");
	},
	//存储文件名字
	filename: function (req, file, cb) {
        var fileFormat = file.originalname.split(".");
        cb(null, file.fieldname + '-' + Date.now() + "." + fileFormat[fileFormat.length - 1])
    }
})
//配置上传参数
var upload = multer({
	storage:storage
})
app.post("/uploadimg",upload.any(),function(req,res){
	res.append("Access-Control-Allow-Origin","*");
	if(req.files.length==0){
		res.send('');
	}else{
		res.send(req.files[0].filename);
	}
})


//查询朋友
app.get("/findfriend",function(req,res){
    res.append("Access-Control-Allow-Origin","*");
     let sql =`select userId,userName,userAddress,userImg from userinfo where userPhone = '${req.query.findvalue}' or userNum='${req.query.findvalue}'`;
     connection.query(sql,function(error,results,fields){
                if (error) throw error;
                res.send(JSON.stringify(results));
        })
})

//添加朋友
app.post("/addfriend",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    var time = new Date();
    var timestring = ""+time.getFullYear()+time.getMonth()+time.getDate()+time.getHours()+time.getMinutes()+time.getSeconds()+"";    
	var sql=`insert into friends values (NULL,${req.body.userId},${req.body.friId},'${req.body.remark}',0,${timestring}),(NULL,${req.body.friId},${req.body.userId},'${req.body.userName}',1,${timestring})`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error;
            res.send("success");
            
    })
})
//查询是否已发送申请
app.post("/checkfriend",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    console.log(req.body);
	var sql=`select accstatus from friends where userId=${req.body.userId} and friId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error;
            res.send(JSON.stringify(results));
            
    })
})
//查询朋友表中的数据
app.get("/findall",function(req,res){
    res.append("Access-Control-Allow-Origin","*");
     let sql =`SELECT b.friId,a.userImg,b.remark,b.accstatus FROM friends as b,userinfo as a WHERE a.userId=b.friId and b.userId=${req.query.userId} and b.accstatus!=0`;
     connection.query(sql,function(error,results,fields){
            if (error) throw error;
            res.send(JSON.stringify(results));
    })
})


//修改朋友表中的状态(当已发送过了)
app.post("/updatestatus",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    var time = new Date();
    var timestring = ""+time.getFullYear()+time.getMonth()+time.getDate()+time.getHours()+time.getMinutes()+time.getSeconds()+"";    
    var sql=`update friends set addTime=${timestring} where friId=${req.body.userId} and userId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error;
            res.send("success");
            
    })
})
//修改朋友表中的状态（朋友邀请了）
app.post("/updatestatus1",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    var time = new Date();
    var timestring = ""+time.getFullYear()+time.getMonth()+time.getDate()+time.getHours()+time.getMinutes()+time.getSeconds()+"";    
    var sql=`update friends set remark='${req.body.remark}' where userId=${req.body.userId} and friId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error; 
    })
    var sql=`update friends set addTime=${timestring},accstatus=1 where friId=${req.body.userId} and userId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error;   
    })
})



//////////////////////////////////
app.get("/getfri",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
})
io.on("connection",function(socket){
	console.log(socket.id);
	socket.on("adduser",function(user){
		userlist.push({
			name:user,
			id:socket.id
		})
		io.emit("showlist",userlist);
	})
	socket.on("sendMess",function(data){
		console.log(data);
		io.sockets.sockets[data.id].emit("returnMess",{
			message:data.message
		})
	})
})
app.listen(1701);
console.log("开启服务器");
