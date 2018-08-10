<template>
    <div class="father-box">
        <div class="_cover-top" _v-f50d4fca="" _v-2747733a="">
            <div class="top-back" _v-f50d4fca="">
                <a href="#/personalinfo/infomore"><div><i data-v-1eee6b3e="" class="iconfont icon-zuojiantou"></i>设置性别</div></a>
            </div>
            <div class="top-other" _v-f50d4fca="">
                <div slot="right" class="_align-right" _v-2747733a="">
                    <a href="#/personalinfo/infomore" class="green1"><span  @click="finish" v-show="isShowFinish">完成</span></a>
                </div>
            </div>
            <div class="top-title _effect" _v-f50d4fca="">
                <p _v-f50d4fca="">
                    <span _v-f50d4fca=""></span>
                </p>
            </div>
        </div>
        <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cells weui_cells_access">
            <a data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell" @click="Show(0)">
                <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_bd weui_cell_primary">
                    <p data-v-6e1130aa="" _v-4f0a3ae7="">男</p>
                </div>
                <div v-show="obj.userGender==0" ><i class="iconfont icon-xuanzhong"></i></div>
            </a>
            <a data-v-6e1130aa=""  _v-4f0a3ae7="" class="weui_cell" @click="Show(1)">
                <div data-v-6e1130aa="" _v-4f0a3ae7="" class="weui_cell_bd weui_cell_primary">
                    <p data-v-6e1130aa="" _v-4f0a3ae7="">女</p>
                </div>
                <div data-v-6e1130aa="" _v-4f0a3ae7="" v-show="obj.userGender==1"><i class="iconfont icon-xuanzhong"></i></div>
            </a>
        </div>
    </div>
</template>
<script>
import $ from "jquery";
import cookie from "jquery.cookie";
export default {
  data(){
      return{
        id:"",
        obj:{},
        isShowFinish:false
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
            // console.log(JSON.parse(data)[0])
            _this.obj = JSON.parse(data)[0]
          }
      })
  },
  methods:{
      Show(id){
        //   console.log(id)
          this.obj.userGender = id;
          this.isShowFinish = true
      },
      finish(){
            var _this = this
            $.ajax({
                url:"http://localhost:1701/changuserGender",
                type:"get",
                data:{
                    userGender:_this.obj.userGender,
                    id:_this.obj.userId
                },
                success(data){
                    // console.log(data)
                }
            })
        }
  }
}
</script>

<style scoped>
.green1{color:rgb(4, 248, 4)}
.top-back>a{color: #fff}
.icon-xuanzhong{color:rgb(14, 245, 14)}
/* .icon-xuanzhong{color:red} */

</style>
