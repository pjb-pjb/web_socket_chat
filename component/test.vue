<template>
    <div id="">
        <input v-model="a">
        <input v-model="a">
        <button @click="c">点击</button>
        <div v-for="item in datas">
            <p>========</p>
            <p>{{item.a}}</p>
            <p>{{item.b}}</p>

        </div>
    </div>
</template>

<script>
    export default {
        name: "test",
        data(){
            return{
                a:1,
                datas:[]
            }
        },
        methods:{
            c(){
                this.a++;
                this.datas.push({
                    a:1,
                    b:2
                });
            }
        }
    }
</script>

<style scoped>

</style>