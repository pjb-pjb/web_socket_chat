<template>
  <div class="fridetail">
      <header >
          <a href="#/addfriend"><i class="iconfont icon-zuojiantou"></i></a><p v-html="title"></p>
      </header>
      <a class="weui-search-bar weui-search-bar_focusing"  id="searchBar">
            <form class="weui-search-bar__form">
                <div class="weui-search-bar__box">
                    <i class="weui-icon-search" ></i>
                    <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="手机号或微信号" v-model="findvalue">
                    <a href="javascript:" class="weui-icon-clear" id="searchClear" @click="clearinput"></a>
                </div>
                <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
                    <i class="weui-icon-search"></i>
                    <span>搜索</span>
                </label>
            </form>
            <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel" @click="findfriend">搜索</a>
        </a>
        <div v-show="isobj">
          <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg boxbox">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb" :src="obj.userImg">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title" v-text="obj.userName"></h4>
            </div>
          </a>
          <div class="weui-cell">
            <h4 weui-media-box__title>备注名</h4>
            <div class="weui-media-box__title">
                <input class="weui-input" type="text" placeholder="请输入文本" v-model="remark">
            </div>
          </div>
          <a v-show="isfriend" href="javascript:;" class="weui-btn weui-btn_primary" @click="addfriend">添加到通讯录</a>
      </div>
      <div v-show="fifind" class="unlluser">
        该用户不存在
      </div>
  </div>
</template>
<script>
import $ from "jquery";
export default {
  data(){
    return {
      title:"详细资料",   //标题
      isobj:false,    //用户查询信息的显示控制
      fifind:false,   //用户不存在的显示控制
      findvalue:"",       //输入框值
      obj:{},         
      remark:"",       //备注名
      isfriend:true,     //是否是未添加朋友
      cookeId:0,
      cookeName:""
    }
  },
  mounted(){
      var cookie = JSON.parse($.cookie("user"));
      this.cookeId = cookie.userId;
      this.cookeName = cookie.userName;
  },
  methods:{
    //查询是否已经发送邀请了
    isSend(userId,friId){
      var status="null";
      $.ajax({
            url:"http://localhost:1701/checkfriend",
            type:"POST",
            async:false,
            data:{
                userId:userId,
                friId:friId
            },
            success(data){
              if(data=="[]"){
                status="null";
              }else if(JSON.parse(data)[0].accstatus==0){
                status=0;
              }else if(JSON.parse(data)[0].accstatus==1){
                status=1;
              }else{
                status=2;
              }
            }
        })
        return status;
    },
    //搜索用户
    findfriend(){
      if(/^\w{1,}$/.test(this.findvalue)){
        var _this = this;
        $.ajax({
            url:"http://localhost:1701/findfriend",
            type:"GET",
            data:{
                findvalue:_this.findvalue
            },
            success(data){
              if(data=="[]"){
                _this.isobj=false;
                _this.fifind=true;
              }else{
                _this.isobj=true;
                _this.fifind=false;
                _this.obj=JSON.parse(data)[0];
                _this.remark=_this.obj.userName;
                var status = _this.isSend(_this.cookeId,_this.obj.userId);
                //搜索用户是否是自己
                if(_this.obj.userId==_this.cookeId || status==2){
                  _this.isfriend=false;
                }else{
                  _this.isfriend=true;
                }
              }
            }
        })
      }else{
        this.fifind=true;
      }
    },
    //添加好友
    addfriend(){
      var _this = this;
      var newmark="";
      var uid = this.cookeId;
      var status = this.isSend(uid,this.obj.userId); 
      console.log(status)
      if(this.remark!=""){
          newmark=this.remark;
        }else{
          newmark=this.obj.userName;
        }
      //不是好友
      if(status=="null"){
        $.ajax({
              url:"http://localhost:1701/addfriend",
              type:"POST",
              data:{
                  userId:uid,
                  friId:_this.obj.userId,
                  remark:newmark,
                  userName:_this.cookeName
              },
              success(data){
                console.log(data);
              }
        })
        //已发送过好友请求
      }else if(status==0){
        console.log(newmark);
        $.ajax({
            url:"http://localhost:1701/updatestatus",
            type:"POST",
            data:{
                userId:uid,
                friId:_this.obj.userId,
                remark:newmark
            }
        })
        //未接受对方好友请求，向对方发送请求
      }else if(status==1){
        $.ajax({
            url:"http://localhost:1701/updatestatus1",
            type:"POST",
            data:{
                userId:uid,
                friId:_this.obj.userId,
                remark:newmark
            }
        })
      }
      
    },
    //清空输入框操作
    clearinput(){
      this.findvalue="";
      this.isobj=false;
    }

  }
}
</script>

<style scoped>
.fridetail{
    background-color: #EBEBEB;
}
header{
    line-height: 45px;
    font-size:45px;
    width: 100%;
    background: linear-gradient(180deg, #303036, #3c3b40);
    font-size: 19px;
    height: 45px;
    color: #fff;
}
header a{
    float: left;
    color: #fff;
    height: 100%;
    
}
header i{
    float: left;
    color: #fff;
    padding:0px 10px;
    height:100%;
    line-height: 100%;
     margin-top:12px; 
}
header p{
    float: left;
    padding-left:10px;
}
.weui-media-box,.weui-cell{
  background-color: white;
}

.weui-cell{
  border:0;
  margin-top: 10px;
}
.weui-cell h4{
  font-size:16px;
  font-weight: 500;
  padding-right:5%;
  width:20%;
}
.weui-cell:before{
  content: "";
  border:0;
}
.box{
  margin-top:10px;
}
.place{
  margin-top:10px;

}
.place h4{
  font-weight: 500;
  padding-right:5%;
}
.place p{
  color:#757575;

}
.weui-btn{
margin-top:20px;
width:80%;
}
.unlluser{
  height:40px;
  line-height:40px;
  font-size: 16px;
  text-align: center;
  background-color: white;
}
</style>
