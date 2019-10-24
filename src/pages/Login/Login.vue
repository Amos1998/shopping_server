<template>
  <div class="bac">
    <div class="bac_t">
      <div class="bac_b">
        <h3 class="login-title">欢迎登录</h3>
        <!--面板标题-->
        <div class="login-header-title">
          <a href="javascript:;" :class="{current: loginMode}" @click="dealLoginMode(true)">短信登录</a>
          <a href="javascript:;" :class="{current: !loginMode}" @click="dealLoginMode(false)">密码登录</a>
        </div>
        <el-form ref="loginForm" :model="rules" :rules="rules" label-width="80px" class="login-box" :class="{current: !loginMode}">
          <div>
            <el-form-item label="手机号" prop="phone">
              <el-input type="text" placeholder="请输入手机号" v-model="form.phone"/>
            </el-form-item>
            <el-form-item prop="code" class="code" label="验证码">
              <el-input v-model="form.code" placeholder="验证码"></el-input>
              <el-button type="primary" :disabled='isDisabled' @click="sendCode">{{buttonText}}</el-button>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" v-on:click="login()">登录</el-button>
            </el-form-item>
          </div>
        </el-form>
        <el-form ref="loginForm" :model="form" :rules="rules" label-width="80px" class="login-box" :class="{current: loginMode}">
          <div>
            <el-form-item label="用户名" prop="username">
              <el-input type="text" placeholder="请输入用户名" v-model="form.username"/>
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-input type="password" placeholder="请输入密码" v-model="form.password"/>
            </el-form-item>
            <section class="login-message">
              <el-input type="text" maxlength="4" placeholder="验证码" v-model="form.captcha" class="yanzhen"></el-input>
              <img
                class="get-verification"
                src="http://localhost:3000/api/captcha"
                alt="captcha"
                @click.prevent="getCaptcha()"
                ref="captcha"

              >
            </section>
            <el-form-item>
              <el-button type="primary" v-on:click="login()">登录</el-button>
            </el-form-item>
          </div>
        </el-form>
        <el-dialog
          title="温馨提示"
          :visible.sync="dialogVisible"
          width="30%"
          >
          <span>请输入账号和密码</span>
          <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
      </span>
        </el-dialog>
      </div>
    </div>
  </div>
</template>

<script>
  import {getPhoneCode,phoneCodeLogin,pwdLogin} from './../../api/index';

  import {mapActions} from 'vuex'

  export default {
    name: "Login",
    data() {
      // <!--验证手机号是否合法-->
      let checkTel = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入手机号码'))
        } else if (!this.checkMobile(value)) {
          callback(new Error('手机号码不合法'))
        } else {
          callback()
        }
      }
      //  <!--验证码是否为空-->
      let checkSmscode = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入手机验证码'))
        } else {
          callback()
        }
      }

      return {
        loginMode: true, // 登录方式, true 手机验证码登录, flase 账号登录
        form: {
          username: '',// 用户名
          password: '',// 密码
          phone: '', // 手机号码
          code: '', // 验证码
          pwdMode: true, // 密码的显示方式, true 密文  false 明文
          captcha: '', // 图形验证码
        },

        // 表单验证，需要在 el-form-item 元素中增加 prop 属性
        rules: {
          // password: [{ validator: validatePass,required: true, message: '密码不可为空', trigger: 'blur'  }],
          // phone: [{ validator: checkTel, trigger: 'change' }],
          // code: [{ validator: checkSmscode, trigger: 'change' }],
          // username: [{required: true, message: '账号不可为空', trigger: 'blur'}]
        },
        buttonText: '发送验证码',
        isDisabled: false, // 是否禁止点击发送验证码按钮
        flag: true,
        // 对话框显示和隐藏
        dialogVisible: false
      }
    },
    computed: {
      phoneRight() {
        return /^1[34578]\d{9}$/.test(this.form.phone);
      }
    },
    methods: {
      ...mapActions(['syncUserInfo']),

      // 1. 处理登录的方式
      dealLoginMode(flag) {
        this.loginMode = flag;
      },
      // 发送验证码
      async sendCode() {
        let tel = this.form.phone
        if (this.checkMobile(tel)) {
          // console.log(tel)
          let time = 60
          this.buttonText = '已发送'
          this.isDisabled = true
          if (this.flag) {
            this.flag = false;
            let timer = setInterval(() => {
              time--;
              this.buttonText = time + ' 秒'
              if (time === 0) {
                clearInterval(timer);
                this.buttonText = '重新获取'
                this.isDisabled = false
                this.flag = true;
              }
            }, 1000)
          }
        }
        //  获取短信验证码
        const result = await getPhoneCode(this.form.phone);

        // 获取验证码失败
        if(result.err_code === 0){
          // console.log(result.message);
          this.open()
        }
      },

      // 验证手机号
      checkMobile(str) {
        let re = /^1\d{10}$/
        if (re.test(str)) {
          return true;
        } else {
          return false;
        }
      },

      // 获取图形验证码
      getCaptcha(){
        this.$refs.captcha.src = 'http://localhost:3000/api/captcha?time=' + new Date();
      },

      // 5. 登录
      async login(){
        // 5.1 登录模式
        if(this.loginMode) {
          if (!this.form.phone) { // 短信登录
            this.$alert('请输入手机号码!', '消息提示', {
              confirmButtonText: '确定'
            });
            return;
          } else if (!this.phoneRight) {
            this.$alert('请输入正确的手机号码!', '消息提示', {
              confirmButtonText: '确定'
            });
            return;
          }
          if (!this.form.code) {
            this.$alert('请输入验证码!', '消息提示', {
              confirmButtonText: '确定'
            });
            return;
          } else if (!(/^\d{6}$/gi.test(this.form.code))) {
            this.$alert('请输入正确的验证码!', '消息提示', {
              confirmButtonText: '确定'
            });
            return;
          }

          // 5.2 手机验证码登录
          const result = await phoneCodeLogin(this.form.phone, this.form.code);
          if (result.success_code === 200) {
            this.form.userInfo = result.message;
          } else {
            this.form.userInfo = {
              message: '登录失败, 手机号码或验证码不正确!'
            }
          }
        } else { // 密码登录---实现注册
          if(!this.form.username){
            this.$alert('请输入用户名!', '消息提示', {
              confirmButtonText: '确定'
            });
            return;
          }else if(!this.form.password){
            this.$alert('请输入密码!', '消息提示', {
              confirmButtonText: '确定'
            });
            return;
          }else if(!this.form.captcha){
            this.$alert('请输入验证码!', '消息提示', {
              confirmButtonText: '确定'
            });
            // this.getCaptcha()
            return;
          }
          // 5.2 发起请求
          const result = await pwdLogin(this.form.username, this.form.password, this.form.captcha);
          console.log(result);
          if (result.success_code === 200) {
            this.form.userInfo = result.message;
            if (this.form.userInfo.data){
              this.$alert('该用户不存在', '消息提示', {
                confirmButtonText: '确定'
              });
            }
          }
          if (result.err_code == 0) {
            this.form.userInfo = result.message
            }
          }


        // 6. 后续的处理
        if(!this.form.userInfo.id){
          this.$alert('登录失败', '消息提示', {
            confirmButtonText: '确定'
          });
          this.getCaptcha()
        }else {
          // 6.1 同步用户的信息
          this.syncUserInfo(this.form.userInfo);
          // 6.2 回到主界面
          this.$router.push('/');
        }
      },

      //消息弹框
      open() {
        this.$alert('获取验证码失败', '消息提示', {
          confirmButtonText: '确定'
        });
      }
    }
  }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  .login-message{
    text-align:center;
    margin-bottom: 22px;
  }
  .yanzhen{
    width: 40%!important;
  }
 .get-verification{
   height:40px;
 }
  .bac_b>.current{
    display:none;
  }
  .bac {
    background: url("./imgs/a.jpg")no-repeat;
    background-size 100% 100%
  }
  .bac_t{
    position relative
    height 700px
    width 100%
  }
  .login-header-title>.current{
    color mediumpurple
    font-weight 700
    border-bottom 2px solid mediumpurple
  }
  .bac_b {
    border: 1px solid #DCDFE6;
    width: 450px;
    /*margin: 180px auto;*/
    position absolute
    left 50%
    top 180px
    transform translateX(-50%)
    padding: 35px 35px 15px 35px;
    border-radius: 5px;
    background-color: #fff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    box-shadow: 0 0 25px #909399;
  }

  .login-title {
    text-align: center;
    margin: 0 auto 20px auto;
    color: #303133;
  }
  .el-form-item__label::before{
  content: '*';
  color: #F56C6C;
  margin-right: 4px;
  }
    .login-header-title{
      text-align center
      margin-bottom 20px
    }
  .el-input{
    width 80%
  }
  .code >>> .el-form-item__content {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width:62%;
  }
  .el-form-item.code>.el-form-item__content{

  }
  .code button {
    margin-left: 20px;
    width: 140px;
    text-align: center;
  }
    .code .el-input{
      width 50%
    }
  .el-button--primary:focus {
    background: #409EFF;
    border-color: #409EFF;
    color: #fff;
  }
</style>
