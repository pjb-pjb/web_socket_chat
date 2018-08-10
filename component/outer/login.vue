<template>
    <div id="loginbg">
        <div class="header">
            <a href="#/reglog"><b class="iconfont icon-zuojiantou"></b></a>
            <i>|</i>
        </div>
        <form class="logform" id="userlog">
            <h3 v-text="titlebool?title[0]:title[1]"></h3>
            <div class="mydetailinfo">
                <span v-text="titlebool?phonenum[0]:phonenum[1]"></span><input type="text" v-model="username"
                                                                               @blur="namenoshow" @focus="namenshow">
                <i class="clearcon" @click="clearconname" v-show="nameisdel">×</i>
                <em class="messshow" :style="{display:namemessshow?'block':'none'}">用户名不存在</em>
            </div>
            <div class="mydetailinfo">
                <span v-text="span[0]"></span><input type="password" v-model="userpass" @blur="passnoshow"
                                                     @focus="passnshow">
                <i class="clearcon" @click="clearconpass" v-show="passisdel">×</i>
                <em class="messshow" :style="{display:passmessshow?'block':'none'}">密码错误</em>
            </div>
            <div class="mydetailinfo">
                <span @click="tophone" v-show="titlebool">用手机号登录</span>
                <span @click="tophone" v-show="!titlebool">账号登录</span>
            </div>
            <div class="mydetailinfo">
                <a href="javascript:void(0)"><span v-text="span[1]" @click="userlogin"></span></a>
            </div>
        </form>
    </div>
</template>
<script>
    import $ from "jquery";
    import "jquery.cookie";

    export default {
        data() {
            return {
                span: ["密码", "登录"],
                title: ["账号登录", "手机登录"],
                phonenum: ["账号", "手机"],
                titlebool: true,
                username: "",
                userpass: '',
                namemessshow: false,
                passmessshow: false,
                isLogin: false,
                isclear: false,
                nameisdel: false,
                passisdel: false
            }
        },
        methods: {
            tophone() {
                this.titlebool = !this.titlebool;
            },
            clearconname() {
                this.username = "";
            },
            clearconpass() {
                this.userpass = "";
            },
            namenshow() {
                this.nameisdel = true;
            },
            namenoshow() {
                this.nameisdel = false;
            },
            passnshow() {
                this.passisdel = true;
            },
            passnoshow() {
                this.passisdel = false;
            },
            userlogin() {
                var self = this;
                if (self.titlebool == true) {
                    $.ajax({
                        url: "http://localhost:1701/login/num",
                        type: "post",
                        data: {
                            username: self.username,
                            userpass: self.userpass
                        },
                        success: function (data) {
                            self.namemessshow = false;
                            self.passmessshow = false;
                            //返回空值
                            if (data.length == 0) {
                                self.namemessshow = true;
                            } else {//存在
                                if (self.userpass == data[0].userPass) {
                                    var obj = {
                                        "userId": data[0].userId,
                                        "userName": data[0].userName,
                                        "userNum": data[0].userNum
                                    };
                                    $.cookie("user", JSON.stringify(obj));
                                    self.isLogin = true;
                                    self.$router.push({path: '/totaltab/wechat'})
                                } else {
                                    self.passmessshow = true;
                                }
                            }
                        }
                    })
                } else {
                    $.ajax({
                        url: "http://localhost:1701/login/phone",
                        type: "post",
                        data: {
                            username: self.username,
                            userpass: self.userpass
                        },
                        success: function (data) {
                            self.namemessshow = false;
                            self.passmessshow = false;
                            //返回空值
                            if (data.length == 0) {
                                self.namemessshow = true;
                            } else {//存在
                                if (self.userpass == data[0].userPass) {
                                    var obj = {
                                        "userNum": data[0].userNum,
                                        "userId": data[0].userId,
                                        "userName": data[0].userName
                                    };
                                    $.cookie("user", JSON.stringify(obj));
                                    //self.isLogin=true;
                                    self.$router.push({path: '/totaltab/wechat'})
                                } else {
                                    self.passmessshow = true;
                                }
                            }
                        }
                    })
                }

            }
        }
    }
</script>
<style scoped>
    * {
        margin: 0;
        padding: 0;
    }

    a {
        text-decoration: none;
        display: block;
    }

    i {
        font-style: normal;
    }

    input {
        border: 0;
        outline: none;
        background: #FFFFFF;
    }

    #loginbg {
        width: 100%;
        height: 100%;
        background: #FFFFFF;
    }

    #loginbg .header {
        background: #393A3F;
        height: 7%;
        font-size: 16px;
        color: white;
    }

    #loginbg .header a {
        color: white;
    }

    #loginbg .header a, #loginbg header i, #loginbg header span {
        margin-left: 5%;
        float: left;
        display: block;
        height: 100%;
        line-height: 50px;
    }

    #loginbg .header i {
        color: #2B2C31;
        width: 2px;
    }

    .logform {
        overflow: hidden;
    }

    .logform h3 {
        font-size: 20px;
        color: #292929;
        text-align: center;
        height: 16%;
        line-height: 64px;
        font-weight: 600;
    }

    .mydetailinfo {
        position: relative;
        margin: 0 8%;
        height: 10%;
        width: auto;
        font-size: 18px;
        line-height: 100%;
        border-bottom: 1px solid #D8D8D8;
        overflow: hidden;
    }

    .mydetailinfo span, .mydetailinfo input {
        display: block;
        float: left;
        line-height: 70px;
    }

    .mydetailinfo input, .mydetailinfo i {
        margin-left: 32px;
        font-size: 20px;
    }

    .mydetailinfo:nth-of-type(3) {
        border: 0;
        color: #5C698C;
        font-size: 18px;
    }

    .mydetailinfo:nth-of-type(4) {
        border: 0;
        overflow: hidden;
        margin-top: 5%;
    }

    .mydetailinfo:nth-of-type(4) a {
        display: block;
        height: 100%;
        width: 100%;
    }

    .mydetailinfo:nth-of-type(4) span {
        color: white;
        width: 100%;
        text-align: center;
        background: #51C326;
    }

    .messshow {
        position: absolute;;
        color: red;
        font-style: normal;
        font-size: 12px;
        left: 76%;
        top: 38%;
    }

    .clearcon {
        position: absolute;;
        color: grey;
        font-style: normal;
        font-size: 12px;
        left: 60%;
        top: 38%;
        background: rgba(0, 0, 0, 0.2);
        border-radius: 50%;
        width: 18px;
        height: 18px;
        text-align: center;
        line-height: 16px;
    }
</style>


