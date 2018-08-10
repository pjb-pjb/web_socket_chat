<template>
  <div class="maillist">
     <a :href="i.href" class="weui-media-box weui-media-box_appmsg" v-for="i in arr1">
        <div class="weui-media-box__hd img1">
            <img class="weui-media-box__thumb" :src="i.img">
        </div>
        <div class="weui-media-box__bd">
            <h4 class="weui-media-box__title" v-text="i.name">标题一</h4>
        </div>
      </a>
      <div class="list_con">
      <a :href="'#/friendlistdetail?fid='+i.friId+'&p='+i.remark" class="weui-media-box weui-media-box_appmsg" v-for="i in obj" @click="clicklist(i.friId)">
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
// import searchbar from "../common/searchbar.vue";
import addfriend from "../../img/addfriend.jpg";
import friendstalk from "../../img/friendstalk.jpg";
import label from "../../img/label.jpg";
import sumnumber from "../../img/sumnumber.jpg";
import $ from "jquery";


export default {
  // components: {
  //   searchbar
  // },
  data() {
    return {
      arr1: [
        {
          name: "新的朋友",
          id: 0,
          img: addfriend,
          href:"#/addfriend"
        },
        {
          name: "群聊",
          id: 1,
          img: friendstalk,
          href:"#"
        },
        {
          name: "标签",
          id: 2,
          img: label,
          href:"#"
        },
        {
          name: "公众号",
          id: 3,
          img: sumnumber,
          href:"#"
        }
      ],
      obj:[],
      cookeId:0
    };
  },
  methods: {
    //点击跳转到详情页
    clicklist(friId){
      this.$store.state.friend=friId;
    }
  },
  mounted(){
      var cookie = JSON.parse($.cookie("user"));
      this.cookeId = cookie.userId;
        //页面加载好友
        var _this = this;
        $.ajax({
            url:"http://localhost:1701/friendList",
            type:"GET",
            data:{
                userId:_this.cookeId
            },
            success(data){
                _this.obj=JSON.parse(data);
            }
        })
    }
};
</script>
<style scoped>
img {
  width: 100%;
  display: block;
}
.maillist {
  background-color: #ebebeb;
   padding-bottom: 47px;
}
.list_con {
  margin-top: 12px;
}
.weui-media-box{
  background-color: white;
}
.weui-media-box_appmsg .weui-media-box__hd{
  width:10%;
  height:100%;
}
</style>
