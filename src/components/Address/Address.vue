<template>
  <el-dialog title="收货地址" :visible.sync="dialogFormVisible">
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="收货人" prop="name">
        <el-input v-model="ruleForm.name"></el-input>
      </el-form-item>
      <el-form-item label="所在地区" prop="province" required>
        <el-cascader
          size="large"
          :options="options"
          v-model="selectedOptions"
          @change="handleChange">
        </el-cascader>
      </el-form-item>
      <el-form-item label="详细地址" prop="desc">
        <el-input type="textarea" v-model="ruleForm.desc"></el-input>
      </el-form-item>
      <el-form-item label="联系电话" prop="phone" class="phoneadd">
        <el-input v-model.number="ruleForm.phone" class="input-with-select">
          <el-select v-model="selectNation" slot="prepend" placeholder="请选择">
            <el-option label="中国大陆+86" value="+86"></el-option>
            <el-option label="香港+852" value="+852"></el-option>
            <el-option label="澳门+853" value="+853"></el-option>
            <el-option label="台湾+886" value="+886"></el-option>
          </el-select>
        </el-input>
      </el-form-item>
      <el-form-item prop="email" label="邮箱">
        <el-input v-model="ruleForm.email"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script>
    import {addAddress} from './../../api/index';

    export default {
        name: "Address",
        data(){
            let checkPhone = (rule, value, callback) => {
                if (!value) {
                    return callback(new Error('收货人联系电话不能为空'));
                } else {
                    const reg = /^1[3|4|5|7|8][0-9]\d{8}$/
                    if (reg.test(value)) {
                        callback();
                    } else {
                        return callback(new Error('请输入正确的联系电话'));
                    }
                }
            };
            let checkProvince = (rule, value, callback)=>{
                if (!value) {
                    return callback(new Error('地址不能为空'));
                }else {
                    callback();
                }
            };
            return {
                options: regionData,
                selectedOptions: [],
                dialogTableVisible: false,
                dialogFormVisible: false,
                ruleForm: {
                    name: '',
                    province: '',
                    desc: '',
                    phone:'',
                    email:''
                },
                rules: {
                    name: [
                        {required: true, message: '请输入收货人名称', trigger: 'blur'},
                        {min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur'}
                    ],
                    province: [
                        {required: true, validator: checkProvince, trigger: 'blur'}
                    ],
                    desc: [
                        {required: true, message: '请填写详细地址', trigger: 'blur'}
                    ],
                    phone: [
                        {required: true, validator: checkPhone, trigger: 'blur'}
                    ],
                    email: [
                        { required: true, message: '请输入邮箱地址', trigger: 'blur' },
                        { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
                    ]
                }
            }
        },
        methods:{

            //省市区三级联动
            handleChange (value) {
                this.ruleForm.province = CodeToText[this.selectedOptions[0]]+CodeToText[this.selectedOptions[1]]+CodeToText[this.selectedOptions[2]]
            },

            //填写地址信息
            submitForm(formName) {
                let biao = this.ruleForm;
                this.$refs[formName].validate(async (valid) => {
                    if (valid) {
                        const result = await addAddress(biao);
                        this.$alert(result.message, '消息提示', {
                            confirmButtonText: '确定'
                        });
                        this.$refs[formName].resetFields();
                        this.selectedOptions = [];
                        this.dialogFormVisible =false;
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },

            //重置地址信息
            resetForm(formName) {
                this.$refs[formName].resetFields();
                this.selectedOptions = []
            }
        },
    }
</script>

<style scoped>

</style>
