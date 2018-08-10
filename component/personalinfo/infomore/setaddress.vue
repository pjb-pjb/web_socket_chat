<template>
    <div class="father-box">
        <div class="_cover-top" _v-f50d4fca="" _v-2747733a="">
            <div class="top-back" _v-f50d4fca="">
                <a href="#/personalinfo/infomore/infomoremain"><div><i data-v-1eee6b3e="" class="iconfont icon-zuojiantou"></i></div></a>
            </div>
            <div class="top-other" _v-f50d4fca="">
                <div slot="right" class="_align-right" _v-2747733a="">
                    <a href="#/personalinfo/infomore/infomoremain"><span v-show="isShowfinish" @click="finish" class="green1">完成</span></a>
                </div>
            </div>
            <div class="top-title _effect" _v-f50d4fca="">
                <p _v-f50d4fca="">
                    <span _v-f50d4fca=""></span>
                </p>
            </div>
        </div>
         <div class="bg-div">
                <div class="setname">
                    <input type="text" v-model="obj.userAddress" @input="textchang">
                    <span @click="emptycontent"><i class="iconfont icon-shanchu4" ></i></span>
                </div>
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
        color:"green",
        isShowfinish:false
      }
  },
  mounted(){
      this.id = JSON.parse($.cookie("user")).userId;
      var _this = this;
      console.log(1)
      $.ajax({
          url:"http://localhost:1701/getuserinfo",
          type:"get",
          data:{
              id:_this.id
              
          },
          success(data){
            // console.log(data)
            _this.obj = JSON.parse(data)[0]
          }
      })
  },
    methods:{
        emptycontent(){
            this.obj.userName = "";
            this.isShowfinish = false;
        },
        textchang(){
            this.isShowfinish = "green1";
        },
        finish(){
            // console.log(1111)
            var _this = this
            $.ajax({
                url:"http://localhost:1701/changuserAddress",
                type:"get",
                data:{
                    address:_this.obj.userAddress,
                    id:_this.obj.userId
                },
                success(data){
                    // location.href="#/personalinfo"
                }
            })
        }
    }
}
</script>

<style scoped>
.green{
    
    color:green;
}
.green1{
    color:rgb(13, 245, 13);
}
.bg-div {
  background-color: #efeff4;
  height: 100%;
  padding-top: 25px;
}
.bg-div > div {
  width: 100%;
  background: #fff;
  padding: 0 15px;
}
.bg-div input {
  border: none;
  height: 45px;
  line-height: 45px;
  font-size: 16px;
  font-weight: 600;
  outline: none;
}
.setname > span {
  float: right;
  margin-top: 8px;
  color: #bfbfbf;
}
.top-back>a{color: #fff}
</style>

