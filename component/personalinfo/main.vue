<template>
    <div class="father-box">
        <div class="_cover-top" _v-f50d4fca="" _v-70bceff9="">
        <a href="#/totaltab/mine">
            <div class="top-back" _v-f50d4fca="">
                <div><i data-v-1eee6b3e="" class="iconfont icon-zuojiantou"></i>个人信息</div>
            </div>
        </a>
            <div class="top-other" _v-f50d4fca="">
                <div class="_align-right" _v-f50d4fca="">
                    <span class="iconfont" _v-f50d4fca=""></span>
                </div>
            </div>
            <div class="top-title _effect" _v-f50d4fca="">
                <p _v-f50d4fca="">
                    <span _v-f50d4fca=""></span>
                </p>
            </div>
        </div>
    <section class="app-content" style="" _v-c8294afa="">
        <div class="_full_inner _effect component-me" _v-4f0a3ae7="">
            <div class="weui_cells weui_cells_access me-line margin1" _v-4f0a3ae7="">
                <a class="weui_cell" href="#/personalinfo/setheadimg" _v-4f0a3ae7="">
                    <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                        <p _v-4f0a3ae7="">头像</p>
                    </div>
                    <div class="weui_cell_ft" _v-4f0a3ae7="">
                        <img class="_align-middle" style="width:60px" :src="obj.userImg" _v-4f0a3ae7=""> </div>
                </a>
            </div>
            <div class="weui_cells weui_cells_access information" _v-4f0a3ae7="">
                <a class="weui_cell" href="#/personalinfo/setname" _v-4f0a3ae7="">
                    <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                        <p _v-4f0a3ae7="">昵称</p>
                    </div>
                    <div class="weui_cell_ft" _v-4f0a3ae7="" v-text="obj.userName"></div>
                </a>
                <a class="weui_cell" href="javascript:;" _v-4f0a3ae7="">
                    <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                        <p _v-4f0a3ae7="">微信号</p>
                    </div>
                    <div class="chatnum" _v-4f0a3ae7="" v-text="obj.userNum"></div>
                </a>
                <a class="weui_cell" href="javascript:;" _v-4f0a3ae7="">

                    <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                        <p _v-4f0a3ae7="">我的二维码</p>
                    </div>
                    <div class="weui_cell_ft" _v-4f0a3ae7="">
                        <img class="_align-middle" style="width:25px" :src="img1" _v-4f0a3ae7="">
                    </div>
                </a>
                <a class="weui_cell" href="#/personalinfo/infomore" _v-4f0a3ae7="">
                    <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                        <p _v-4f0a3ae7="">更多</p>
                    </div>
                    <div class="weui_cell_ft" _v-4f0a3ae7=""></div>
                </a>
            </div>
            <div class="weui_cells weui_cells_access" _v-4f0a3ae7="">
                <a class="weui_cell" href="#/personalinfo/myplace" _v-4f0a3ae7="">
                    <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                        <p _v-4f0a3ae7="">我的地址</p>
                    </div>
                    <div class="weui_cell_ft" _v-4f0a3ae7=""></div>
                </a>
            </div>
        </div>
    </section>
    </div>
</template>

<script>

import "./infomore/common.css"
// import "../../template/common.css"
import $ from "jquery";
import cookie from "jquery.cookie";
import img1 from "../../img/personinfo/chat-info-qr.0838167.png";
export default {
  data(){
      return{
        id:"",
        obj:{},
        img1:img1
      }
  },
  mounted(){
      this.id = JSON.parse($.cookie("user")).userId;
      var _this = this;
      $.ajax({
          url:"http://localhost:1701/getuserinfo",
          type:"get",
          data:{
              id:_this.id,
          },
          success(data){
            _this.obj = JSON.parse(data)[0]
          }
      })
  },
  methods:{
      
  }
}
</script>

/* import "../../template/common.css" */
<style scoped>
.information {
  margin-top: -1px;
}
.app-content {
  padding-top: 0;
}
.father-box {
  background: #efeff4;
}
.me-line .weui_cell_hd img {
  width: 60px;
  display: block;
}

.me-line .weui_cell_primary {
  font-size: 14px;
  color: #111111;
}

.me-line .weui_cell_primary p:first-child {
  font-size: 18px;
}

.me-line .weui_cell_hd {
  margin-right: 5px;
  border-radius: 5px;
  overflow: hidden;
  border: 1px solid #cccccc;
}
.component-me {
  padding-top: 1px;
  background-color: #efeff4;
}
a {
  color: white;
}
.chatnum {
  color: #888;
}
.margin1{margin-bottom:1px}
</style>
