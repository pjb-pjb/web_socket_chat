<template>
  <div id="searchnews">
    <div class="header">
        <a href="#/totaltab/maillist"><b class="iconfont icon-zuojiantou"></b></a>
        <i class="ll">|</i>
        <span>按备注搜索好友</span>
    </div>
    <div id="searchBar" :class="cancelbool?'weui-search-bar weui-search-bar_focusing':'weui-search-bar'" >
        <form class="weui-search-bar__form">
            <div class="weui-search-bar__box">
                <i class="weui-icon-search" @click="searchfriend"></i>
                <input type="search" autofocus="autofocus" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required="" v-model="searchcon">
                <a href="javascript:" class="weui-icon-clear" id="searchClear" @click="clearcon"></a>
            </div>
            <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);" @click="showcancel">
                <i class="weui-icon-search"></i>
                <span>搜索</span>
            </label>
        </form>
        <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel" @click="cancelinput">取消</a>
    </div>
      <div class="searchlist">
        <a href="#/friendlistdetail" class="weui-media-box weui-media-box_appmsg" v-for="i in obj" @click="clicklist(i.friId)">
          <div class="weui-media-box__hd img1">
              <img class="weui-media-box__thumb" :src="i.userImg">
          </div>
          <div class="weui-media-box__bd">
              <h4 class="weui-media-box__title" v-text="i.remark"></h4>
          </div>
      </a>
      </div>
  </div>
</template>
<script>
import $ from "jquery";
import cookie from "jquery.cookie";
import searchbar from "../common/searchbar.vue";
import xheader from "../common/xheader.vue";
export default {
  data(){
    return {
      cancelbool:true,
      searchcon:"",
      obj:[],
      cookeId:0
    }
  },
  components:{
      searchbar
  },
  methods:{
    showcancel(){
      this.cancelbool=true;
    },
    cancelinput(){
      this.cancelbool=false;
    },
    clearcon(){
      this.searchcon="";
    },
    //点击跳转到详情页
    clicklist(friId){
      this.$store.state.friend=friId;
    },
    searchfriend(){
      var cookie = JSON.parse($.cookie("user"));
      this.cookeId = cookie.userId;
        //页面加载好友
        var _this = this;
        $.ajax({
            url:"http://localhost:1701/searchfriend",
            type:"GET",
            data:{
                userId:_this.cookeId,
                searchcon:_this.searchcon
            },
            success(data){
                _this.obj=JSON.parse(data);
                console.log(_this.obj);
            }
        })
    }
  }
}
</script>
<style scoped>
#searchnews{width:100%;height:100%;background: #FFFFFF;}
#searchnews .header{
    background: #393A3F;
    height:7%;
    font-size: 16px;
    color:white;
    line-height: 51px;
}
#searchnews .header a{color: white;}
#searchnews .header a,#loginbg header i,#loginbg header span{margin-left:5%;float:left;display: block;height:100%;line-height: 50px;}
#searchnews .header i{color:#2B2C31;width:2px;margin-left: 32px;font-style: normal;}
img {
  width: 100%;
  display: block;
}
.searchlist{
  background-color: #ebebeb;
}
.weui-media-box{
  background-color: white;
}
.weui-media-box_appmsg .weui-media-box__hd{
  width:10%;
  height:100%;
}
</style>

