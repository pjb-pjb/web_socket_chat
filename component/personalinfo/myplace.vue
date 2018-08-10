<template>
  <div class="father-box headimg-box">
    <div class="_cover-top" _v-f50d4fca="" _v-2747733a="">
        <div class="top-back" _v-f50d4fca="">
            <a href="#/personalinfo"><div><i data-v-6e1130aa="" data-v-1eee6b3e="" class="iconfont icon-zuojiantou"></i>返回</div></a>
        </div>
        <div class="top-other" _v-f50d4fca="">
            <div slot="right" class="_align-right" _v-2747733a="">
                <span _v-2747733a=""><span class="green"></span></span>
            </div>
        </div>
        <div class="top-title _effect" _v-f50d4fca="">
            <p _v-f50d4fca="">
                <span _v-f50d4fca=""></span>
            </p>
        </div>
    </div>
    <div class="weui_cells weui_cells_access me-line" _v-4f0a3ae7="">
        <a class="weui_cell" href="javascript:;" _v-4f0a3ae7="">
            <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                <p _v-4f0a3ae7="" v-text="obj.userName"></p>
                <p _v-4f0a3ae7="" class="address">
                    <span _v-4f0a3ae7=""v-text="obj.userAddress">&nbsp;&nbsp;</span>
                </p>
            </div>
            <div class="" _v-4f0a3ae7=""><i class="iconfont icon-gantanhaozhong"></i></div>
        </a>
    </div>
    <div class="weui_cells weui_cells_access newaddress" _v-4f0a3ae7="">
        <a class="weui_cell" href="javascript:;" _v-4f0a3ae7="">
            <div class="weui_cell_bd weui_cell_primary" _v-4f0a3ae7="">
                
                <p _v-4f0a3ae7=""><i class="iconfont icon-jiahao"></i>&nbsp;&nbsp;新增地址</p>
            </div>
            <div class="weui_cell_ft" _v-4f0a3ae7=""></div>
        </a>
    </div>

  </div>
</template>
<style scoped>
.weui_cell_primary>p>span{color:#888}
.newaddress{margin-top:0}
.icon-jiahao:before{color: blue;font-size: 18px}
.icon-gantanhaozhong:before{color: blue;font-size: 32px}
.top-back>a{color: #fff}
.address>span{display: inline-block;width: 300px;font-size: 14px}
</style>
<script>
import $ from "jquery";
import cookie from "jquery.cookie";
export default {
  data(){
      return{
        obj:{}
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
            // console.log(data)
            _this.obj = JSON.parse(data)[0]
          }
      })
  },
}
</script>




