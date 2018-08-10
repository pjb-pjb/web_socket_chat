<template>
    <div class="father-box setimg-box">
        <div class="_cover-top" _v-f50d4fca="" _v-2747733a="">
            <div class="top-back" _v-f50d4fca="">
                <a href="#/personalinfo"><div><i data-v-1eee6b3e="" class="iconfont icon-zuojiantou"></i>个人头像</div></a>
            </div>
            <div class="top-other" _v-f50d4fca="">
                <div slot="right" class="_align-right" _v-2747733a="">
                    <span _v-2747733a=""></span>
                </div>
            </div>
            <div class="top-title _effect" _v-f50d4fca="">
                <p _v-f50d4fca="">
                    <span _v-f50d4fca=""></span>
                </p>
            </div>
        </div>
        <div class="bigheadimg"><img :src="obj.userImg" @click="Showheadimg"></div>
        <transition name="abc">
            <div class="headimg-pop" v-show="isShowheadimg">
                <div class="headimg-all">
                    <div>
                        <a>本地上传</a>
                        <a>查看上一张图片</a>
                        <a>保存图片</a>
                    </div>
                    <div class="cancel"><a @click="Hiddenheadimg">取消</a>
                    </div>
                </div>
            </div>
        </transition>
        <div class="mask" v-show="isShowheadimg" @click="Hiddenheadimg"></div>
    </div>
</template>
<script>
import $ from "jquery";
import cookie from "jquery.cookie";
import "../../template/animate.css"
export default {
  data(){
      return{
        id:"",
        obj:{},
        isShowheadimg:false
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
  methods: {
    //获取头像的基本信息
    getImg() {
      var id = $.cookie("");
      $.ajax({
        url: "",
        type: "get",
        data: {
          id: id
        },
        success: data => {
          // console.log(data);
          
          this.img = data.img;
        }
      });
    },
    //点击符号。出现更改图片的选项
    Showheadimg() {
      this.isShowheadimg = true;
    },
    Hiddenheadimg(){
        this.isShowheadimg = false;
    }
  }
};
</script>








<style scoped>
.setimg-box {
  background: #000;
  height: 667px;
}
.headimg-pop {
  width: 100%;
  background: #888;
  position: absolute;
  z-index:9999;
  bottom:0;
  /* display: none; */
}
.headimg-pop a {
  display: block;
  height: 45px;
  line-height: 45px;
  text-align: center;
  width: 100%;
  border-bottom: 1px solid #818192;
  color: #000;
  background: #fff;
}
.cancel {
  margin-top: 10px;
}
.bigheadimg > img {
  width: 100%;
}
.bigheadimg {
  margin-top: 100px;
}
.top-back > a {
  color: #fff;
}
.abc-enter-active {
  animation: slideInUp 0.5s;
}
.abc-leave-active {
  animation: fadeOutDown 0.8s;
  /* animation: slideInUp 0.5s; */
}
.mask {
  height: 100%;
  width: 100%;
  opacity: 0.3;
  background: #000;
  position: absolute;
  z-index: 888;
  top:0
}
</style>
<style scoped>
/* .father-box{height:100%;} */
</style>

