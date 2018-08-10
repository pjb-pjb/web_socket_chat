<template>
    <div class="fd">
        <header >
            <a href="#/totaltab/maillist"><i class="iconfont icon-zuojiantou"></i></a><p v-html="title"></p>
        </header>
          <div>
          <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg boxbox">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb" :src="obj.userImg">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title" v-text="obj.remark"></h4>
                <p class="weui-media-box__title smallp" >微信号：{{obj.userNum}}</p>
                <p class="weui-media-box__title smallp" >昵&ensp;&ensp;称：{{obj.userName}}</p>
            </div>
          </a>
          <p class="update">备注名</p>
          <div class="weui-cell">
              
                <div class="weui-media-box__title">
                    <input class="weui-input" type="text" placeholder="修改备注名" v-model="remark">
                
                </div> 
                <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary" @click="updatemark">修改</a>
          </div>
          <a :href="'#/dialog?fid='+fid+'&p='+p" class="weui-btn weui-btn_primary" @click="send">发送信息</a>
        </div>
        <div id="toast" :style="{display:isShow?'block':'none'}">
        <div class="weui-mask_transparent"></div>
        <div class="weui-toast">
            <i class="weui-icon-success-no-circle weui-icon_toast"></i>
            <p class="weui-toast__content">修改成功</p>
        </div>
        </div>
    </div>
</template>
<script>
import addfriend from "../../img/addfriend.jpg";
import cookie from "jquery.cookie";
import $ from "jquery";
import Vue from "vue";

export default {
    data(){
      return {
          title:"详细资料",
          cookeId:0,
          obj:{},
          remark:"",
          isShow:false,
          fid:this.$route.query.fid,
          p:this.$route.query.p
      }
  },
  mounted(){
      var cookie = JSON.parse($.cookie("user"));
      this.cookeId = cookie.userId;
    var id = this.$store.state.friend;
    var _this = this;
        $.ajax({
            url:"http://localhost:1701/getfridetail",
            type:"POST",
            data:{
                userId:_this.cookeId,
                friId:id
            },
            success(data){
                if(data!="[]"){
                     _this.obj=JSON.parse(data)[0];
                     _this.remark=_this.obj.remark;
                }
            }
        })
  },
  methods:{
      send(){
          this.$store.state.friend=this.obj.friId;
          this.$store.state.fremark=this.obj.remark;
      },
      //修改备注名
      updatemark(){
          var _this = this;
          
        $.ajax({
            url:"http://localhost:1701/updateMark",
            type:"POST",
            data:{
                userId:_this.cookeId,
                friId:this.obj.friId,
                remark:_this.remark
            },
            success(data){
                _this.isShow=true;
                setTimeout(function(){
                    _this.isShow=false;
                },1000)
                if(data!="[]"){
                     _this.obj=JSON.parse(data)[0];
                     _this.remark=_this.obj.remark;
                }
                
            }
        })
      }
  }
}
</script>
<style scoped>
.fd{
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
  padding-top:5px;
}
.weui-cell h4{
  font-size:16px;
  font-weight: 500;
  width:auto;
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
.weui-btn_mini{
    width:21%;
    margin:0;
}
.weui-media-box_appmsg .weui-media-box__hd{
    width:80px;
    height:80px;
    padding:10px 0;
    margin-right: 1.5em;
}
.smallp{
    color:#757575;
    font-size:15px;
}
.weui-media-box__title{
    width:79%;
}
.update{
    margin-top:15px;
    background-color: white;
    padding-left:12px;
    color:#757575;
    padding-top:10px;
}
</style>


