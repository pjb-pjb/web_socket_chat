<template>
  <div id="regbg">
      <div class="header">
          <a href="#/reglog"><b class="iconfont icon-zuojiantou"></b></a>
          <i>|</i>
          <span v-text="span[0]"></span>
      </div>
      <form name="regform" id="userreg">
            <div class="mydetailinfo">
                <span v-text="span[1]"></span><input type="text" v-model="username" @blur="namenoshow" @focus="namenshow" placeholder="6-12位字母数字组合" @input="nameisin">
                <i class="clearcon clearconfir" @click="clearconname" v-show="nameisdel">×</i>
                <em class="messshow" :style="{display:namemessshow?'block':'none'}">用户名格式错误</em>
                <em class="messshow" :style="{display:hasnamemessshow?'block':'none'}">用户名已存在</em>
            </div>
            <div class="mydetailinfo">
                <span v-text="span[6]"></span><input type="text" v-model="usernick" @focus="nicknshow">
                <i class="clearcon" @click="clearconnick" v-show="nickisdel">×</i>
            </div>
            <div class="mydetailinfo">
                <span v-text="span[2]"></span> <input class="sex" type="radio" value="0" name="gender" checked v-model="usergender"><i>男</i><input class="sex" v-model="usergender" type="radio" value="1" name="gender"><i>女</i>
            </div>
            <div class="mydetailinfo">
                <span v-text="span[3]"></span><input type="text" v-model="userphone" @blur="numnoshow" @focus="numnshow" @input="phoneisin">
                <i class="clearcon" @click="clearconphone" v-show="numisdel">×</i>
                <em class="messshow" :style="{display:nummessshow?'block':'none'}">电话号码格式错误</em>
                <em class="messshow" :style="{display:hasphonemessshow?'block':'none'}">电话号码重复</em>
            </div>
            <div class="mydetailinfo">
                <span v-text="span[4]"></span><input type="password" v-model="userpass" @blur="passnoshow" @focus="passnshow" placeholder="6-12位数字字母">
                <i class="clearcon" @click="clearconpass" v-show="passisdel">×</i>
                <em class="messshow" :style="{display:passmessshow?'block':'none'}">密码格式错误</em>
            </div>
            <div class="mydetailinfo">
                <a href="javascript:void(0)" class="regbbt"><span v-text="span[5]" @click="userreg"></span></a>
            </div>
            <div class="mydetailinfo">
                <p>点击上面的注册按钮，即表示你同意<a>《腾讯微信软件许可及服务协议》</a>和<a>《微信隐私保护指引》</a></p>
            </div>
            <div class="picture">
                <div class="weui-uploader__input-box">
                        <input id="uploaderInput" name="userlogo" class="weui-uploader__input" type="file" accept="image/*" multiple="" @change="showuserimg">
                </div>
            </div>
            <div class="picture">
                <img class="weui-uploader__file" src='' alt="  " id="upuserpic"/>
            </div>
      </form>
  </div>
</template>
<script>
import $ from "jquery";
var src=[];
function upload(){
		$.ajax({
            url:"http://localhost:1701/uploadimg",
            type:"POST",
            //async:false,
            processData:false,
            contentType:false,
            cache:false,
            data:new FormData($("#userreg")[0]),
            success:function(data){
                src.push(data);
            }
        });
	return src;
}

export default {
  data(){
      return {
          span:["新用户注册","账户","性别","手机号","密码","注册","昵称"],
          username:'',
          usernick:"",
          usergender:"",
          userphone:"",
          userpass:"",
          namemessshow:false,
          passmessshow:false,
          nummessshow:false,
          hasnamemessshow:false,
          hasphonemessshow:false,
          isReg:false,
          isclear:false,
          nameisdel:false,
          passisdel:false,
          numisdel:false,
          nickisdel:false,
          str:"",
          alluser:[]//所有已注册用户信息
      }
  },
  methods:{
    //判断数组对象里是否存在某个属性值  
    isInclude(arr,attr){
        for(var i=0;i<arr.length;i++){
            for(var j in arr[i]){
                if(arr[i][j]==attr){
                    return true;
                }
            }
        }
        return false;
    },
    //清空文本框内容
    clearconname(){
      this.username="";
    },
    clearconpass(){
      this.userpass="";
    },
    clearconphone(){
        this.userphone="";
    },
    clearconnick(){
        this.usernick="";
    },
    //显示清空小图标
    namenshow(){
      this.nameisdel=true;
    },
    passnshow(){
      this.passisdel=true;
    },
    numnshow(){
      this.numisdel=true;
    },
    nicknshow(){
        this.nickisdel=true;
    },
    //判断数据库里面是否存在相同的微信号
    nameisin(){
        if(this.isInclude(this.alluser,this.username)){
            this.hasnamemessshow=true;
            this.namemessshow=false;
        }else{
            this.hasnamemessshow=false;
        }
    },
    //判断数据库里面是否存在相同的电话号码
    phoneisin(){
        if(this.isInclude(this.alluser,this.userphone)){
            this.hasphonemessshow=true;
            this.nummessshow=false;
        }else{
            this.hasphonemessshow=false;
        }
    },
    //判断输入格式
    namenoshow(){
        if(/\w{6,12}/.test(this.username)==false){
            this.namemessshow=true;
        }else{
            if(/^\d{6,12}$/.test(this.username)==true || /^[a-zA-Z]{6,12}$/.test(this.username)==true){
                this.namemessshow=true;
            }else{
                this.namemessshow=false;
            }      
        }
      this.nameisdel=false;
    },
    passnoshow(){
        if(/^\w{6,12}$/.test(this.userpass)==false){
            this.passmessshow=true;
        }else{
            this.passmessshow=false;
        }
      this.passisdel=false;
    },
    numnoshow(){
        if(/^1\d{10}$/.test(this.userphone)==false){
            this.nummessshow=true;
        }else{
            this.nummessshow=false;
        }
      this.numisdel=false;
    },
    //上传头像显示图片
    showuserimg(){
        var uploaderInput = $("#uploaderInput");
        var imgFile = uploaderInput[0].files[0];
        var fr = new FileReader();
        fr.onload = function() {
            var pic=$("#upuserpic");
            pic[0].src = fr.result;
        };
        fr.readAsDataURL(imgFile);  
    },
    //注册按钮事件
    userreg(){
          if(this.username && this.userpass && this.usergender && this.userphone && this.userpass){
              if(this.isInclude(this.alluser,this.username)==false && this.isInclude(this.alluser,this.userphone)==false){
                    var self=this;
                    var path=upload();
                    if(path[0]==''){
                        this.str='User.jpg';
                    }else{
                        this.str=path[0];
                    }
                    $.ajax({
                        url:"http://localhost:1701/userreg",
                        type:"POST",
                        data:{
                            username:self.username,
                            usernick:self.usernick,
                            usergender:self.usergender,
                            userphone:self.userphone,
                            userpass:self.userpass,
                            userimg:self.str
                        },
                        success:function(data){
                            console.log(data)
                            if(data=='1'){
                                self.isReg=true;
                                self.$router.push({ path: '/login' })
                                //location.href="";
                                //console.log(self.isReg)
                            }else{
                                self.isReg=false;
                                self.$router.push({ path: '/register' })
                            }

                        }
                    })
              }
          }else{
              this.isReg=false;
          }
      }
  },
  mounted(){
    //获取已注册信息
    var self=this;
    $.ajax({
        url:"http://localhost:1701/userreg/isin",
        type:"post",
        success:function(data){
            self.alluser=data;
        }
    })
  }
}
</script>
<style scoped>
html,body{width:100%;height:100%;}
*{margin:0;padding:0;}
#regbg{background: #FFFFFF;width:100%;height:100%;}
a{text-decoration: none;display: block;}
i{font-style: normal;}
input{border:0;outline: none;background: #FFFFFF;}
#regbg .header{
    background: #393A3F;
    height:7%;
    font-size: 16px;
    color:white;
}
#regbg .header a{color: white;}
#regbg .header a,#regbg .header i,#regbg .header span{margin-left:5%;float:left;display: block;height:100%;line-height: 50px;}
#regbg .header i{color:#2B2C31;width:2px;}
.regform{overflow: hidden;position: relative;}
.mydetailinfo{position:relative;margin:0 4%;height:10%;width:auto;font-size: 18px;line-height: 100%;border-bottom: 1px solid #D8D8D8;overflow: hidden;}
.mydetailinfo  span,.mydetailinfo input,.mydetailinfo i{display:block;float: left;line-height: 70px;}
.mydetailinfo input,.mydetailinfo i{margin-left: 32px;font-size: 20px;}
.mydetailinfo:nth-of-type(1){border-bottom-color: #51C326;}
.mydetailinfo:nth-of-type(6){border:0;overflow: hidden;margin-top:5%;}
.mydetailinfo:nth-of-type(6) span{color: white;width: 100%;text-align: center;background: #51C326;}
.mydetailinfo:nth-last-of-type(3) i{line-height: 70px;}
.mydetailinfo:nth-of-type(7){border:0;}
.mydetailinfo:nth-of-type(7) p{font-size: 14px;color:#989898;}
.mydetailinfo:nth-of-type(7) p a{text-decoration: underline;display: inline;font-size: 14px;line-height: 24px;color: #5C637D;}
.picture{position:absolute;left:74%;;top:7%;width:100px;height:100px;}
.weui-uploader__input-box{width:100%;height: 100%;border:0;}
.picture:nth-of-type(2){border:0;}
.picture img{width: 100%;height:100%;text-align: center;font-size: 12px;line-height: 67px;}
.messshow{position: absolute;;color:red;font-style: normal;font-size: 12px;left:60%;top:38%;}
.mydetailinfo .clearcon{position: absolute;;color:grey;font-style: normal;font-size: 12px;left:80%;top:38%;background: rgba(0, 0, 0, 0.2);
border-radius: 50%;width:18px;height:18px;text-align: center;line-height: 16px;}
.mydetailinfo .clearconfir{left:45%;}
.sex{margin-top:9%;}
.weui-uploader__input-box:before,.weui-uploader__input-box:after{background: #989898;}
.regbbt{overflow: hidden;}
</style>


