<template>
    <div>
        <xheader />
        <router-view></router-view>
        <xfooter />
    </div>
  
</template>

<script>
    import xheader from "../common/xheader.vue"
    import xfooter from "../common/xfooter.vue"
    export default{
        components:{
            xfooter,
            xheader
        }
    }
</script>
