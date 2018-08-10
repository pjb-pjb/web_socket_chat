<template>
  <div id="reglogbg">
    <img src="../../img/logo.jpg"/>
    <div class="reglogbtns">
      <a href="#/login" class="logbtn">登录</a>
      <a href="#/register" class="regbtn">注册</a>
    </div>
    
  </div>
</template>
<script>
export default {
  
}
</script>
<style scope>
*{margin:0;padding: 0;}
#reglogbg{
  width:100%;
  height: 100%;
  position:relative;
}
#reglogbg img{
  width:100%;
  height:100%;
  display: block;
}
.reglogbtns{overflow: hidden;position:absolute;top:88%;left:10%;height:42px;width:90%;}
.reglogbtns a{float: left;width:35%;height:42px;text-align: center;line-height: 42px;font-size: 16px;text-decoration: none;}
.logbtn{color:white;background: #45C018;margin-right: 31px;}
.regbtn{color: #3E3E3E;background: #F1F1F1;margin-left: 31px;}
</style>

