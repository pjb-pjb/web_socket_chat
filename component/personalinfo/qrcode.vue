<template>
  <div class="qrcode-modul">
    <div class="_cover-top" _v-f50d4fca="" _v-2747733a="">
        <div class="top-back" _v-f50d4fca="">
            <a href="#/personalinfo"><div class="_ellipsis iconfont icon-return-arrow v-link-active" _v-f50d4fca="">个人信息</div>
            </a>
        </div>
        <div class="top-other" _v-f50d4fca="">
            <div slot="right" class="_align-right" _v-2747733a="">
                <span _v-2747733a=""><span class="green"><i class="iconfont icon-more"></i></span></span>
            </div>
        </div>
        <div class="top-title _effect" _v-f50d4fca="">
            <p _v-f50d4fca="">
                <span _v-f50d4fca="">我的二维码</span>
            </p>
        </div>
    </div>
    <div class="bigheadimg">
        <div class="headimg-top">
            <div>
                <img src="../../img/personinfo/1499914112624921aaaa7e1a76cf937757f564538142e.jpg">
            </div>
            <div>
                <div class="usertitle">
                    <span>扈冲</span>
                    <span>男</span>
                </div>
                <div class="userplace">
                    <span>山西省</span>
                    <span>大同市</span>
                    <span>南郊区</span>
                </div>
            </div>
        </div>
        <div class="head-bg"><img src="../../img/personinfo/1499914112624921aaaa7e1a76cf937757f564538142e.jpg" alt=""></div>
        <div><span>扫一扫上面的二维码图案，加我微信</span></div>
    </div>
  </div>
</template>
<style>
/* .father-box {
  background: #000;
} */
.qrcode-modul{background: #000}
.top-back>a{color: #fff}
</style>








<style scoped>
/* 图片样式 */

.bigheadimg > div {
  width: 90%;
  margin: 0 5%;
  height: width;
}
.bigheadimg {
  margin-top: 100px;
  background: #fff;
  margin-left: 5%;
  width: 90%;
  padding-top: 20px;
}
.headimg-top > div > img {
  height: 53px;
}
.headimg-top > div {
  display: inline-block;
  margin-left: 10px;
}
.usertitle > span {
  font-size: 18px;
  font-weight: 800;
  line-height: 20px;
  height: 20px;
  display: inline-block;
}
.userplace > span {
  font-size: 14px;
  color: #888;
}
.head-bg>img{
    width:80%;

}
</style>
