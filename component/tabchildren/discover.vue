<template>
  <div class="discover">
    <div class="group" v-for="arr in arr1">
        <a href="#" class="weui-media-box weui-media-box_appmsg" v-for="obj in arr" >
            <div class="weui-media-box__hd img1">
                <img class="weui-media-box__thumb" :src="obj.img">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title" v-text="obj.name">标题一</h4>
            </div>
        </a>
    </div>
  </div>
</template>
<script>
// import searchbar from "../common/searchbar.vue";
import dis1 from "../../img/dis1.jpg";
import dis2 from "../../img/dis2.jpg";
import dis3 from "../../img/dis3.jpg";
import dis4 from "../../img/dis4.jpg";
import dis5 from "../../img/dis5.jpg";
import dis6 from "../../img/dis6.jpg";
import dis7 from "../../img/dis7.jpg";
import dis8 from "../../img/dis8.jpg";
import dis9 from "../../img/dis9.jpg";
import dis10 from "../../img/dis10.jpg";
export default {
  // components:{
  //     searchbar
  // },
  data(){
    return {
      arr1:[
          [{
            img:dis1,
            name:"朋友圈"
          }],[{
            img:dis2,
            name:"扫一扫"
          },{
            img:dis3,
            name:"摇一摇"
          }],[{
            img:dis4,
            name:"看一看"
          },{
            img:dis5,
            name:"搜一搜"
          }],[{
            img:dis6,
            name:"附近的人"
          },{
            img:dis7,
            name:"漂流瓶"
          }],[{
            img:dis8,
            name:"购物"
          },{
            img:dis9,
            name:"游戏"
          }],[{
            img:dis10,
            name:"小程序"
          }]
      ]
     }
  }
}
</script>
<style scoped>
.group{
  margin-top:14px;
}
img {
  width: 100%;
  display: block;
}
.discover {
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
