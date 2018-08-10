var app = require("express")();
var mysql = require("mysql");
var server = require("http").createServer(app);
var io = require("socket.io")(server);
var userlist = {};
var connection = mysql.createConnection({
	host:"10.40.153.231",
	user:"liusong",
	password:"123456",
	database:"wechat"
});
connection.connect();

app.get("/getfri",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
})
io.on("connection",function(socket){
	console.log(socket.id);
	socket.on("adduser",function(user){
		userlist["userNum"]=user;
		userlist["id"]=socket.id;
		io.emit("showlist",userlist);
	})
	socket.on("setSocketId",function(data){
		console.log(data);
		connection.query(`update userInfo set userSocketId = '${data.socketId}' where userNum = '${data.userNum}'`,function(error,result){
			if(error) throw error;
			console.log('success');
		})
	})
	
	socket.on("getSocketId",function(data){
		connection.query(`select userSocketId from userInfo where userId = ${data}`,function(error,result){
			if(error) throw error;
			console.log(1);
			console.log(result);
			socket.emit("giveSocketId",result[0].userSocketId);
		})
	})
	socket.on("sendMess",function(data){
		console.log(data);
		connection.query(`select userImg from userInfo where userId = ${data.user}`,function(error,result){
			if(error) throw error;
			console.log(2);
			io.sockets.sockets[data.id].emit("returnMess",{
				message:data.message,
				user:result[0].userImg
			})
		})
		
	})
})
server.listen(1701);
console.log("开启服务器");