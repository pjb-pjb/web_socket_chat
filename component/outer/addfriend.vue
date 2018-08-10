<template>
  <div class="addfriend">
      <header >
          <a href="#/totaltab/maillist"><i class="iconfont icon-zuojiantou"></i></a><p v-html="title"></p>
      </header>
      <div class="weui-search-bar"  id="searchBar" :class="{'weui-search-bar_focusing':bool}">
            <form class="weui-search-bar__form">
                <div class="weui-search-bar__box">
                    <i class="weui-icon-search" ></i>
                    <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required="">
                    <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
                </div>
                <label class="weui-search-bar__label" id="searchText" @click="jumphref" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
                    <i class="weui-icon-search"></i>
                    <span>搜索</span>
                </label>
            </form>
            <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel" >取消</a>
        </div>
        <p class="newfriend">新的朋友</p>
        <div class="list">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg" v-for="i in obj">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb" :src="i.userImg" alt="">
                    </div>
                    <div class="weui-media-box__bd">
                        <h4 class="weui-media-box__title" v-text="i.remark"></h4>
                        <p class="weui-media-box__desc" >对方请求添加你为朋友</p>
                    </div>
                    <div class="status">
                        <p class="weui-media-box__desc" v-show="i.accstatus==2">已添加</p>
                        <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary" v-show="i.accstatus==1" @click="aggreAdd(i.friId)">接受</a>
                    </div>
                </a>
        </div>
        <div id="toast" :style="{display:isShow?'block':'none'}">
        <div class="weui-mask_transparent"></div>
        <div class="weui-toast">
            <i class="weui-icon-success-no-circle weui-icon_toast"></i>
            <p class="weui-toast__content">添加成功</p>
        </div>
    </div>
  </div>
</template>
<script>
import $ from "jquery";
import "../../font/iconfont.css";
export default {
    data(){
      return {
          title:"新的朋友",
          bool:false,   //搜索框的显示
          obj:[],
          cookeId:0,
          isShow:false
      }
    },
    methods:{
        //点击搜索框跳转页面
        jumphref(){
            location.href="#/fridetail"
        },
        //点击接受，同意添加好友
        aggreAdd(friId){
            var _this = this;
            $.ajax({
                url:"http://localhost:1701/aggreAdd",
                type:"GET",
                data:{
                    userId:_this.cookeId,
                    friId:friId
                },
                success(data){
                _this.obj=JSON.parse(data);
                _this.isShow=true;
                setTimeout(function(){
                    _this.isShow=false;
                },1000)
            }
            })
        }
        
    },
    mounted(){
        var cookie = JSON.parse($.cookie("user"));
        this.cookeId = cookie.userId;
        //页面加载好友申请
        var _this = this;
        $.ajax({
            url:"http://localhost:1701/findall",
            type:"GET",
            data:{
                userId:_this.cookeId
            },
            success(data){
                _this.obj=JSON.parse(data);
            }
        })
    }
}
</script>
<style scoped>
.addfriend{
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
.status{
    width:21%;
    text-align: right;
}
.newfriend{
    margin-left: 15px;
    margin-top:15px; 
    color:#999999;
}
.list{
    background-color: white;
}
.weui-media-box_appmsg .weui-media-box__hd{
    width:55px;
    height:55px;
}
</style>


