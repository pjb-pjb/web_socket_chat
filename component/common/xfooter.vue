<template>
    <div class="weui-tabbar">
        <a href="#/totaltab/wechat" class="weui-tabbar__item" :class="{'weui-bar__item_on':id==0}" @click="isOn(0)">
            <span style="display: inline-block;position: relative;">
                <i class="iconfont icon-weixin " :class="{'fontColor':id==0}"></i>
            
            </span>
            <p class="weui-tabbar__label">微信</p>
        </a>
        <a href="#/totaltab/maillist" class="weui-tabbar__item" :class="{'weui-bar__item_on':id==1}" @click="isOn(1)">
            <i class="iconfont icon-tongxunlu" :class="{'fontColor':id==1}"></i>
            <p class="weui-tabbar__label">通讯录</p>
        </a>
        <a href="#/totaltab/discover" class="weui-tabbar__item" :class="{'weui-bar__item_on':id==2}" @click="isOn(2)">
            <span style="display: inline-block;position: relative;">
                <i class="iconfont icon-faxian" :class="{'fontColor':id==2}"></i>
                
            </span>
            <p class="weui-tabbar__label">发现</p>
        </a>
        <a href="#/totaltab/mine" class="weui-tabbar__item" :class="{'weui-bar__item_on':id==3}" @click="isOn(3)">
           <i class="iconfont icon-wo" :class="{'fontColor':id==3}"></i>
            <p class="weui-tabbar__label">我</p>
        </a>
    </div>
</template>
<script>
export default {
  data(){
      return {
          id:0
      }
  },
  mounted(){
      //console.log(this.$store.state)
    var arr=location.href.split(":")
    var words=arr[arr.length-1].split("/");
    var key=words[words.length-1]
    if(/^wechat$/.test(key)){
        this.id=0;
    }
    if(/^maillist$/.test(key)){
        this.id=1;
    }
    if(/^discover$/.test(key)){
        this.id=2;
    }
    if(/^mine$/.test(key)){
        this.id=3;
    }
  },
  methods:{
      isOn(id){
          this.id = id;
      }
  }
}
</script>
<style scoped>
    i{
        line-height: 1;
    }
    .fontColor{
        color:#09BB07;
    }
    .weui-tabbar{
        position: fixed;
        bottom:-1px;
        
    }
</style>




