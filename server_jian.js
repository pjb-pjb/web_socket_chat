var express = require("express");
var mysql = require("mysql");

//实例化express
var app = express();
//post请求体模块
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(express.static('./img'));
var connection = mysql.createConnection({
		host:"localhost",
		user:"fecshop",
		password:"root",
		database:""
	});
connection.connect();

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
     let sql =`SELECT b.friId,a.userImg,b.remark,b.accstatus FROM friends as b,userinfo as a WHERE a.userId=b.friId and b.userId=${req.query.userId} and b.accstatus!=0  ORDER BY b.addtime DESC`;
     connection.query(sql,function(error,results,fields){
            if (error) throw error;
            res.send(JSON.stringify(results));
    })
})

//查询朋友表中的数据   显示列表
app.get("/friendList",function(req,res){
    res.append("Access-Control-Allow-Origin","*");
     let sql =`SELECT b.friId,a.userImg,b.remark FROM friends as b,userinfo as a WHERE a.userId=b.friId and b.userId=${req.query.userId} and b.accstatus=2 ORDER BY CONVERT(b.remark USING gbk) ASC`;
     connection.query(sql,function(error,results,fields){
            if (error) throw error;
            res.send(JSON.stringify(results));
    })
})


//修改朋友表中的状态(当已发送过了)  0
app.post("/updatestatus",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    var timestring =timeChange();
    var sql=`update friends set addTime=${timestring} where friId=${req.body.userId} and userId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error;
    })
    var sql=`update friends set remark='${req.body.remark}',addTime=${timestring} where userId=${req.body.userId} and friId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error;
    })
})
//修改朋友表中的状态（朋友邀请了）  1
app.post("/updatestatus1",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    var timestring =timeChange();
    var sql=`update friends set remark='${req.body.remark}' where userId=${req.body.userId} and friId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error; 
    })
    var sql=`update friends set addTime=${timestring},accstatus=1 where friId=${req.body.userId} and userId=${req.body.friId}`;
	 connection.query(sql,function(error,results,fields){
            if (error) throw error;   
    })
})
//同意添加好友  1req.query.userId
app.get("/aggreAdd",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    var timestring =timeChange();
    var sql1=`update friends set accstatus=2,addTime=${timestring} where userId=${req.query.userId} and friId=${req.query.friId}`;
	 connection.query(sql1,function(error,results,fields){
            if (error) throw error; 
    })
    var sql2=`update friends set addTime=${timestring},accstatus=2 where friId=${req.query.userId} and userId=${req.query.friId}`;
	 connection.query(sql2,function(error,results,fields){
            if (error) throw error;   
    })
    let sql3 =`SELECT b.friId,a.userImg,b.remark,b.accstatus FROM friends as b,userinfo as a WHERE a.userId=b.friId and b.userId=${req.query.userId} and b.accstatus!=0 ORDER BY b.addtime DESC`;
     connection.query(sql3,function(error,results,fields){
            if (error) throw error;
            res.send(JSON.stringify(results));
    })
})
//显示列表详情页
app.post("/getfridetail",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    let sql =`SELECT b.friId,a.userImg,b.remark,a.userName,a.userNum FROM friends as b,userinfo as a WHERE a.userId=b.friId and b.userId=${req.body.userId} and b.friId=${req.body.friId}`;
     connection.query(sql,function(error,results,fields){
            if (error) throw error;
            res.send(JSON.stringify(results));
    })
})

//修改备注名
app.post("/updateMark",function(req,res){
	res.append("Access-Control-Allow-Origin","*");
    //req.body是post传输的数据
    let sql =`update friends set remark='${req.body.remark}' where userId=${req.body.userId} and friId=${req.body.friId}`;
     connection.query(sql,function(error,results,fields){
            if (error) throw error;
    })
    let sql1 =`SELECT b.friId,a.userImg,b.remark,a.userName,a.userNum FROM friends as b,userinfo as a WHERE a.userId=b.friId and b.userId=${req.body.userId} and b.friId=${req.body.friId}`;
     connection.query(sql1,function(error,results,fields){
            if (error) throw error;
            res.send(JSON.stringify(results));
    })
})


function timeChange(){ 
    var time = new Date();
    return ""+time.getFullYear()+stringNum(time.getMonth())+stringNum(time.getDate())+stringNum(time.getHours())+stringNum(time.getMinutes())+stringNum(time.getSeconds())+"";
}
function stringNum(ti){
    if(ti<10){
        ti="0"+ti;
    }
    return ti;
}
app.listen(1701);
console.log("开启服务器");
