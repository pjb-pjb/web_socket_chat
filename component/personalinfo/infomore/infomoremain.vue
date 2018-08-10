<template>
  <div>
    <div class="_cover-top" _v-f50d4fca="" _v-2747733a="">
        <div class="top-back" _v-f50d4fca="">
            <a href="#/personalinfo"><div><i data-v-1eee6b3e="" class="iconfont icon-zuojiantou"></i>个人信息</div></a>
        </div>
    </div>
    <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cells weui_cells_access">
      <a data-v-6e1130aa="" href="#/personalinfo/infomore/sex" _v-4f0a3ae7="" class="weui_cell">
        <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_bd weui_cell_primary">
          <p data-v-6e1130aa="" _v-4f0a3ae7="">性别</p>
        </div> 
        <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_ft"><span v-text="obj.userGender==0?'男':'女'"></span></div>
      </a>
      <a data-v-6e1130aa="" href="#/personalinfo/infomore/setaddress" _v-4f0a3ae7="" class="weui_cell">
        <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_bd weui_cell_primary">
          <p data-v-6e1130aa="" _v-4f0a3ae7="">地区</p>
        </div> 
        <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_ft"><span v-text="obj.userAddress"></span></div>
      </a>
      <a data-v-6e1130aa="" href="javascript:;" _v-4f0a3ae7="" class="weui_cell">
        <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_bd weui_cell_primary">
          <p data-v-6e1130aa="" _v-4f0a3ae7="">个性签名</p>
        </div> 
        <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_ft"><span></span></div>
      </a>
    </div>
  </div>
</template>
<style scoped>
.top-back > a {
  color: #fff;
}
.weui_cell_ft>span{font-size: 14px;margin-left:5px}
</style>
<script>
import $ from "jquery";
import cookie from "jquery.cookie";
export default {
  data(){
      return{
        id:"",
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
  }
}
</script>


