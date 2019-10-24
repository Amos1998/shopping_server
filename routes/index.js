const express = require('express');
const router = express.Router();
const conn = require('./../db/db')
const async = require('async');
const uuidv1 = require('uuid/v1');
const uid = require('uid-safe')
const getId = require('./../db/get_id')

// console.log(uuidv1());

// 引入SVG的验证码文件
const svgCaptcha = require('svg-captcha');
// 处理MD5
const md5 = require('blueimp-md5');
// 引入短信验证码文件
const sms_util = require('./../util/sms_util')
// 用户信息
var users = {};

router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/*
  获取首页轮播图
*/
router.get('/api/homecasual', (req, res)=>{
    let sqlStr = 'select * from homecasual';
    conn.query(sqlStr, (err, results) => {
        if (err) return res.json({err_code: 1, message: '资料不存在', affextedRows: 0})
        res.json({success_code: 200, message: results})
    })
  // const data = require('./../data/homecasual');
  // res.json(data);
});
/*
  获取首页导航
 */
router.get('/api/homenav', (req, res)=>{
  const navJson = require('./../data/homenav');
  res.json({success_code: 200, message: navJson.data});
});
/*
  获取商品列表
 */
router.get('/api/homeshoplist', (req, res)=>{
  // const data = require('./../data/shopList');
  // res.json({success_code: 200, message: data});
    // 1.0 获取参数
    let pageNo = req.query.page || 1;
    let pageSize = req.query.count || 10;
    let typeId = req.query.typeId||1; //识别4大类表
    let stypeId = req.query.stypeId||1; //识别数据线的4小类表
    let tableType = '';//商品列表名

    if(typeId == 1) {
        if(stypeId == 1) { //苹果数据线
            tableType = 'lightning_cable_list'
        } else if (stypeId == 2 ){ //Micro Usb 数据线
            tableType = 'micro_usb_cable_list'
        }else if(stypeId == 3 ){ //Type-C 数据线
            tableType = 'type_c_list'
        }else if(stypeId == 4 ){  //Type-C To Lightning 数据线
            tableType = 'type_c_to_lightning_cable_list'
        }
    } else if (typeId == 2 ){ //充电头//车充
        tableType = 'car_charger_list'
    }else if(typeId == 3 ){ //车充
        tableType = 'charger_list'
    }else if(typeId == 4 ){  //拓展坞
        tableType = 'hub_list'
    }

    let sqlStr = "select * from "+ tableType +" LIMIT "  + (pageNo - 1) * pageSize + "," + pageSize;
    // let sqlStr = 'select * from shop_list LIMIT ' + (pageNo - 1) * pageSize + ',' + pageSize;
    let countSql = "select count(*) as count from " + tableType;
    // console.log(countSql);
    async.series({
        one: function(callback) {
            conn.query(sqlStr, (error, results,fields) => {
                if (error) {
                    res.json({err_code: 0, message: '请求数据失败'});
                } else {
                    callback(null, results);
                    // setTimeout(() => {
                    //     res.json({success_code: 200, message: results});
                    // }, 2000);
                }

            });
        },
        two: function(callback) {
            conn.query(countSql,function(err,rs){
                callback(null, rs);
            })
        },
    }, function(error, results) {
        let dataString = JSON.stringify(results);
        let data = JSON.parse(dataString);
        // console.log(data['two'][0].count)

        res.json({success_code: 200, message: data});
        // res.render('index', {loginbean:loginbean,page:page,rs:rs,count:count,countPage:countPage});
        //res.send('查完');
    });

    // conn.query(sqlStr, (error, results,fields) => {
    //     if (error) {
    //         res.json({err_code: 0, message: '请求数据失败'});
    //     } else {
    //         setTimeout(() => {
    //             res.json({success_code: 200, message: results});
    //         }, 2000);
    //     }
    // });
});
/*
    批量插入数据
 */
const recommendArr = require('./../data/shopList').goods_list;
router.get('/recommend/api', function (req, res, next) {
    // 1. 定义临时数组
    let temp_arr_all = [];
    // 2. 遍历
    for (let i = 0; i < recommendArr.length; i++) {
        // 2.1 取出单个数据对象
        let oldItem = recommendArr[i];
        // 2.2 取出数据表中对应的字段
        let temp_arr = [];
        temp_arr.push(oldItem.goods_name);
        temp_arr.push(oldItem.param);
        temp_arr.push(oldItem.pro_type);
        temp_arr.push(oldItem.thumb_url);
        temp_arr.push(oldItem.price);
        temp_arr.push(oldItem.normal_price);
        // 2.3 合并到大的数组
        temp_arr_all.push(temp_arr);
    }
    // console.log(temp_arr_all);

    // 3. 批量插入数据库表
    // 3.1 数据库查询的语句
    let sqlStr = "INSERT INTO car_charger_list(`goods_name`,`param`, `pro_type`, `thumb_url`, `price`, `normal_price`) VALUES ?";
    // 3.2 执行语句
    conn.query(sqlStr, [temp_arr_all], (error, results, fields) => {
        if (error) {
            console.log(error);
            console.log('插入失败');
        } else {
            console.log('插入成功');
        }
    });
});
// 注册接口
router.post('/api/register', (req, res, next) => {

    let userPhone = req.body.userInfo.tel; // 获取前台传过来的userPhone值
    let userPwd = req.body.userInfo.pass; // 获取前台传过来的userPwd值

    let sqlStr = "SELECT * FROM user_info WHERE user_phone = '" + userPhone + "' LIMIT 1";
    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '请求数据失败'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            if (results[0]) {  // 用户已经存在
                res.json({
                    err_code: 0,
                    message: '该号码已注册！'
                });
            } else { // 新用户
                const addSql = "INSERT INTO user_info(user_name, user_pwd, user_phone) VALUES (?, ?, ?)";
                const addSqlParams = [userPhone, userPwd, userPhone];
                conn.query(addSql, addSqlParams, (error, results, fields) => {
                    results = JSON.parse(JSON.stringify(results));
                    if(!error){
                        req.session.userId = results.insertId;
                        let sqlStr = "SELECT * FROM user_info WHERE id = '" + results.insertId + "' LIMIT 1";
                        conn.query(sqlStr, (error, results, fields) => {
                            if (error) {
                                res.json({err_code: 0, message: '请求数据失败'});
                            } else {
                                results = JSON.parse(JSON.stringify(results));
                                // 返回数据给客户端
                                res.json({
                                    success_code: 200,
                                    message: {id: results[0].id, user_name: results[0].user_name, user_phone: results[0].user_phone},
                                    info:'注册成功！'
                                });
                            }
                        });
                    }
                });
            }
        }
    });
    // if(pool) {
    //     let sql = `insert into user(userId,userName,userPwd) values('${userId}','${userName}','${userPwd}')`;
    //     pool.query(sql, (err, result) => {
    //         if(err) {
    //             res.json({
    //                 status:'0',
    //                 msg:err.message
    //             });
    //         } else {
    //             res.json({
    //                 status:'1',
    //                 msg:'',
    //                 result:''
    //             });
    //         }
    //     });
    // }else {
    //     res.json({
    //         status:'-1',
    //         msg:'error!'
    //     });
    // }
});

/*
  获取搜索分类列表
 */
router.get('/api/searchgoods', (req, res)=>{
    let data = require('./../data/search');
  res.json({success_code: 200, message: data});
});
/**
 * 获取随机图形验证码
 */
router.get('/api/captcha', (req, res)=>{
    // 1. 生成随机的验证码
    var captcha = svgCaptcha.create({
        color: true,
        noise: 2,
        size: 4, // 验证码长度
        ignoreChars: '0o1i', // 验证码字符中排除 0o1i
    });

    // 2. 保存验证码到session
    req.session.captcha = captcha.text.toLocaleLowerCase();
    // console.log(req.session.captcha);

    // 3. 返回给客户端
    res.type('svg');
    res.status(200).send(captcha.data);
});

/**
 * 获取短信验证码
 */
router.get('/api/send_code', (req, res)=>{
    // 1. 获取手机号
    var phone = req.query.phone;
    // 2. 随机产生验证码
    var code = sms_util.randomCode(6);

    // console.log(code);
    /*
    sms_util.sendCode(phone, code, function (success) {
        if(success){ // 验证码已经成功发送到手机
            users[phone] = code;
            res.send({success_code: 200, message: '验证码获取成功!'});
        }else { // 验证码获取失败
            res.send({err_code: 0, message: '验证码获取失败!'});
        }
    });
    */
    // 3. 成功
        users[phone] = code;
        // console.log(users);
        res.send({success_code: 200, message: '验证码获取成功!', code});

    // 4. 失败
    /*setTimeout(()=>{
        res.send({err_code: 0, message: '验证码获取失败!'});
    }, 2000);*/
});

/**
 * 手机验证码登录
 */
router.post('/api/login_code', (req, res) => {
    // 1. 获取数据
    const phone = req.body.phone;
    const code = req.body.code;

    // 2. 验证验证码是否正确
    if(users[phone] !== code){
        res.json({err_code: 0, message: '验证码不正确!'});
    }

    // 3. 查询数据
    delete  users[phone];

    let sqlStr = "SELECT * FROM user_info WHERE user_phone = '" + phone + "' LIMIT 1";

    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '请求数据失败'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            if (results[0]) {  // 用户已经存在
                // console.log(results[0]);
                req.session.userId = results[0].id;
                // 返回数据给客户端
                res.json({
                    success_code: 200,
                    message: {id: results[0].id, user_name: results[0].user_name, user_phone: results[0].user_phone}
                });
            } else { // 新用户
                const addSql = "INSERT INTO user_info(user_name, user_phone) VALUES (?, ?)";
                const addSqlParams = [phone, phone];
                conn.query(addSql, addSqlParams, (error, results, fields) => {
                    results = JSON.parse(JSON.stringify(results));
                    // console.log(results);
                    if(!error){
                        req.session.userId = results.insertId;
                        let sqlStr = "SELECT * FROM user_info WHERE id = '" + results.insertId + "' LIMIT 1";
                        conn.query(sqlStr, (error, results, fields) => {
                            if (error) {
                                res.json({err_code: 0, message: '请求数据失败'});
                            } else {
                                results = JSON.parse(JSON.stringify(results));
                                // 返回数据给客户端
                                res.json({
                                    success_code: 200,
                                    message: {id: results[0].id, user_name: results[0].user_name, user_phone: results[0].user_phone}
                                });
                            }
                        });
                    }
                });
            }
        }
    });

});

/**
 * 用户名和密码登录
 */
router.post('/api/login_pwd', (req, res) => {
    // 1. 获取数据
    const user_name = req.body.name;
    const user_pwd = req.body.pwd;
    const captcha = req.body.captcha.toLowerCase();

    console.log(req.session.captcha);

    // 2. 验证图形验证码是否正确
    if(captcha !== req.session.captcha){
        res.json({err_code: 0, message: '图形验证码不正确!'});
        return;
    }
    delete req.session.captcha;


    // 3. 查询数据
    let sqlStr = "SELECT * FROM user_info WHERE user_name = '" + user_name + "' LIMIT 1";
    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '用户名不正确!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            if (results[0]) {  // 用户已经存在
                // 验证密码是否正确
                if(results[0].user_pwd !== user_pwd){
                    res.json({err_code: 0, message: '密码不正确!'});
                }else {
                    req.session.userId = results[0].id;
                    // console.log(req.session.userId);
                    // 返回数据给客户端
                    res.json({
                        success_code: 200,
                        message: {id: results[0].id, user_name: results[0].user_name, user_phone: results[0].user_phone},
                        info: '登录成功!'
                    });
                }
            } else { // 新用户
                const addSql = "INSERT INTO user_info(user_name, user_pwd) VALUES (?, ?)";
                const addSqlParams = [user_name, user_pwd];
                conn.query(addSql, addSqlParams, (error, results, fields) => {
                    results = JSON.parse(JSON.stringify(results));
                    // console.log(results);
                    if(!error){
                        req.session.userId = results.insertId;
                        let sqlStr = "SELECT * FROM user_info WHERE id = '" + results.insertId + "' LIMIT 1";
                        conn.query(sqlStr, (error, results, fields) => {
                            if (error) {
                                res.json({err_code: 0, message: '请求数据失败'});
                            } else {
                                results = JSON.parse(JSON.stringify(results));
                                // 返回数据给客户端
                                res.json({
                                    success_code: 200,
                                    message: {id: results[0].id, user_name: results[0].user_name, user_phone: results[0].user_phone}
                                });
                            }
                        });
                    }
                });
            }
        }
    });
});
/**
*  根据session中的用户id获取用户信息
*/
router.get('/api/user_info', (req, res) => {
    // 1.0 获取参数
    let userId = req.session.userId;
    // 1.1 数据库查询的语句
    let sqlStr = "SELECT * FROM user_info WHERE id = '" + userId + "' LIMIT 1";
    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '请求数据失败'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            if(!results[0]){
                delete req.session.userId;
                res.json({error_code: 1, message: '请先登录'});
            }else {
                // 返回数据给客户端
                res.json({
                    success_code: 200,
                    message: {id: results[0].id, user_name: results[0].user_name, user_phone: results[0].user_phone}
                });
            }
        }
    });
});
/**
 * 退出登录
 */
router.get('/api/logout', (req, res) => {
    // 1.清除session中的userid
    delete req.session.userId;
    // 2. 返回客户端
    res.json({
        success_code: 200,
        message: '退出登录成功'
    });
});
/**
 * 修改用户信息
 */
router.post('/api/change_user_msg', (req, res) => {
    // 获取数据
    const id = req.body.userId;
    const user_name = req.body.user_name || '';
    const user_sex = req.body.user_sex || '';
    const user_address = req.body.user_address || '';
    const user_birthday = req.body.user_birthday || '';
    const user_sign = req.body.user_sign || '';
    // 验证
    if(!id){
        res.json({error_code: 0, message: '修改用户信息失败！'});
    }
    // 更新数据
    let sqlStr = "SELECT * FROM user_info WHERE id = '" + userId + "' LIMIT 1";
    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '请求数据失败'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            if(!results[0]){
                delete req.session.userId;
                res.json({error_code: 1, message: '请先登录'});
            }else {
                // 返回数据给客户端
                res.json({
                    success_code: 200,
                    message: {id: results[0].id, user_name: results[0].user_name, user_phone: results[0].user_phone}
                });
            }
        }
    });
});

/**
 * 查询商品详细信息
 */
router.get('/api/shopping_info', (req, res) => {
    //  获取客户端传过来的商品信息
    let goods_id = req.query.goods_id;
    let typeId = req.query.typeId||1; //识别4大类表
    let stypeId = req.query.stypeId||1; //识别数据线的4小类表
    let tableType = '';//商品列表名

    if(typeId == 1) {
        if(stypeId == 1) { //苹果数据线
            tableType = 'lightning_cable_list'
        } else if (stypeId == 2 ){ //Micro Usb 数据线
            tableType = 'micro_usb_cable_list'
        }else if(stypeId == 3 ){ //Type-C 数据线
            tableType = 'type_c_list'
        }else if(stypeId == 4 ){  //Type-C To Lightning 数据线
            tableType = 'type_c_to_lightning_cable_list'
        }
    } else if (typeId == 2 ){ //车充
        tableType = 'car_charger_list'
    }else if(typeId == 3 ){ //充电头
        tableType = 'charger_list'
    }else if(typeId == 4 ){  //拓展坞
        tableType = 'hub_list'
    }
    //  查询数据
    let sql_str = "SELECT * FROM " + tableType +" WHERE goods_id = '" + goods_id + "' LIMIT 1";
    conn.query(sql_str, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '服务器内部错误!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            if (error) {
                res.json({err_code: 0, message: '查询商品详细信息失败!'});
            } else {
                res.json({success_code: 200, message: results});
            }
        }
    });

});


/**
 * 添加商品到购物车
 */
router.post('/api/add_shop_cart', (req, res) => {
    // 1. 验证用户
    // console.log(req.body)
    let user_id = req.session.userId;

    if(!user_id){
        res.json({err_code:0, message:'请先登录！'});
        return;
    }
    console.log(req.body)
    // 2. 获取客户端传过来的商品信息
    let goods_id = req.body.goods_id;
    let pro_type = req.body.pro_type;
    let pro_stype = req.body.pro_stype;
    let goods_name = req.body.goods_name;
    let thumb_url = req.body.thumb_url;
    let color_type = req.body.color_type;
    let length_type = req.body.length_type;
    let price = req.body.price;
    let buy_count = req.body.buy_count;
    let is_pay = 0; // 0 未购买 1购买
    // 3. 查询数据
    let sql_str = "SELECT * FROM shopping_cart WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id +"' and color_type = '"+color_type+"' and length_type = '" + length_type+"'" + " LIMIT 1";
    console.log(sql_str)
    conn.query(sql_str, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '服务器内部错误!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            // console.log(results);
            if (results[0]) { // 3.1 商品已经存在
                // console.log(results[0]);
                buy_count = results[0].buy_count + buy_count;
                let sql_str = "UPDATE shopping_cart SET buy_count = " + buy_count + " WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id+"' and color_type = '"+color_type+"' and length_type = '" + length_type+"'";
                conn.query(sql_str, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '加入购物车失败!'});
                    } else {
                        res.json({success_code: 200, message: '加入购物车成功!'});
                    }
                });
            } else { // 3.2 商品不存在
                let add_sql = "INSERT INTO shopping_cart(user_id, goods_id, pro_type, pro_stype, goods_name, thumb_url,color_type,length_type, price, buy_count, is_pay) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                let sql_params = [user_id,goods_id,pro_type, pro_stype, goods_name, thumb_url,color_type,length_type, price, buy_count, is_pay];
                conn.query(add_sql, sql_params, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '加入购物车失败!'});
                    } else {
                        res.json({success_code: 200, message: '加入购物车成功!'});
                    }
                });
            }
        }
    });

});

/**
 * 查询购物车的商品
 */
router.get('/api/cart_goods', (req, res) => {
    let user_id = req.session.userId;
    // console.log(req.session.userId)
    // 1.0 获取参数
    if(!req.session.userId){
        res.json({err_code: 0, message: '请先登录!'});
        return;
    }

    // 1.1 数据库查询的语句
    let sqlStr = "SELECT * FROM shopping_cart WHERE user_id = '" + user_id +"'";
    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '请求数据失败'});
        } else {
            // 返回数据给客户端
            res.json({success_code: 200, message: results});
        }
    });
});

/**
 *修改购物车商品数量
 * @type {Router}
 */
router.post('/api/update_cart_goods_num', (req, res) => {
    // 1. 验证用户
    // console.log(req.body)
    let user_id = req.session.userId;

    if(!user_id){
        res.json({err_code:0, message:'请先登录！'});
        return;
    }

    // 2. 获取客户端传过来的商品信息
    let goods_id = req.body.goods_id;
    let buy_count = req.body.buy_count;

    // 3. 查询数据
    let sql_str = "SELECT * FROM shopping_cart WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id + " LIMIT 1";
    conn.query(sql_str, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '服务器内部错误!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            // console.log(results);
            if (results[0]) { // 3.1 商品已经存在
                let sql_str = "UPDATE shopping_cart SET buy_count = " + buy_count + " WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id + "' LIMIT 1";
                conn.query(sql_str, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '修改购物车商品数量失败!'});
                    } else {
                        res.json({success_code: 200, message: '修改购物车商品数量成功!'});
                    }
                });
            }
        }
    });

});

/**
 *删除购物车商品
 * @type {Router}
 */
router.post('/api/del_cart_goods', (req, res) => {
    // 1. 验证用户
    // console.log(req.body)
    let user_id = req.session.userId;

    if(!user_id){
        res.json({err_code:0, message:'请先登录！'});
        return;
    }

    // 2. 获取客户端传过来的商品信息
    let goods_id = req.body.goods_id;

    // 3. 查询数据
    let sql_str = "SELECT * FROM shopping_cart WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id + "' LIMIT 1";
    conn.query(sql_str, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '服务器内部错误!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            // console.log(results);
            if (results[0]) { // 3.1 商品已经存在
                let sql_str = "DELETE FROM shopping_cart WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id + "' LIMIT 1";
                conn.query(sql_str, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '删除购物车商品失败!'});
                    } else {
                        res.json({success_code: 200, message: '删除购物车商品成功!'});
                    }
                });
            }
        }
    });

})

/**
 * 添加商品到支付订
 */
router.post('/api/save_pay_goods', (req, res) => {
    // 1. 验证用户
    // console.log(req.body)
    let user_id = req.session.userId;

    if(!user_id){
        res.json({err_code:0, message:'请先登录！'});
        return;
    }
    req.body.goods.forEach((value,index)=>{
        // 2. 获取客户端传过来的商品信息
        let goods_id = value.goods_id;
        let goods_name = value.goods_name;
        let thumb_url = value.thumb_url;
        let price = value.price;
        let buy_count = value.buy_count;
        let is_pay = 0; // 0 未购买 1购买

        // 3. 清空数据
        let sql_str = "Delete FROM shopping_order_cart WHERE user_id = '" + user_id + "'";
        conn.query(sql_str, (error, results, fields) => {
            if (error) {
                res.json({err_code: 0, message: '服务器内部错误!'});

            } else {
                    let add_sql = "INSERT INTO shopping_order_cart(user_id, goods_id, goods_name, thumb_url, price, buy_count, is_pay) VALUES (?,?, ?, ?, ?, ?, ?)";
                    let sql_params = [user_id,goods_id, goods_name, thumb_url, price, buy_count, is_pay];
                    conn.query(add_sql, sql_params, (error, results, fields) => {
                        if (error) {
                            res.json({err_code: 0, message: '加入支付订单失败!'});
                        } else {
                            res.json({success_code: 200, message: '加入支付订单成功!'});
                        }
                    });
            }
        });
    });
});

/**
 * 查询支付订单的商品
 */
router.get('/api/get_pay_goods', (req, res) => {
    let user_id = req.session.userId;
    // console.log(req.session.userId)
    // 1.0 获取参数
    if(!req.session.userId){
        res.json({err_code: 0, message: '请先登录!'});
        return;
    }

    // 1.1 数据库查询的语句
    let sqlStr = "SELECT * FROM shopping_order_cart WHERE user_id = '" + user_id +"'";
    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '请求数据失败'});
        } else {
            // 返回数据给客户端
            res.json({success_code: 200, message: results});
        }
    });
});
/**
 * 填写收货地址
 * @type {Router}
 */
router.post('/api/add_address_info', (req, res) => {
    // 1. 验证用户
    // console.log(req.body)
    let user_id = req.session.userId;

    if(!user_id){
        res.json({err_code:0, message:'请先登录！'});
        return;
    }

    // 2. 获取客户端传过来的地址信息
    let address_info = req.body.address_info;

    // 3. 查询数据
    let sql_str = "SELECT * FROM shopping_address_list WHERE 'user_id = '" + user_id +"'";
    conn.query(sql_str, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '服务器内部错误!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            // console.log(results);
            if (results[0]) { // 3.1 商品已经存在
                // 3. 插入地址数据
                let is_default = 1;
                let add_sql = "INSERT INTO shopping_address_list(user_id, address_info, is_default) VALUES (?, ?, ?)";
                let sql_params = [user_id,address_info,is_default];
                conn.query(add_sql, sql_params, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '加入地址信息失败!'});
                    } else {
                        res.json({success_code: 200, message: '加入地址信息成功!'});
                    }
                });
            } else { // 3.2 地址不存在
                // 3. 插入地址数据
                let is_default = 1;
                let add_sql = "INSERT INTO shopping_address_list(user_id, address_info, is_default) VALUES (?, ?, ?)";
                let sql_params = [user_id,address_info,is_default];
                conn.query(add_sql, sql_params, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '加入地址信息失败!'});
                    } else {
                        res.json({success_code: 200, message: '加入地址信息成功!'});
                    }
                });
            }
        }
    });
});

/**
 * 查询收货地址
 */
router.get('/api/get_address_info', (req, res) => {
    let user_id = req.session.userId;
    // console.log(req.session.userId)
    // 1.0 获取参数
    if(!req.session.userId){
        res.json({err_code: 0, message: '请先登录!'});
        return;
    }

    // 1.1 数据库查询的语句
    let sqlStr = "SELECT * FROM shopping_address_list WHERE user_id = '" + user_id +"'";
    conn.query(sqlStr, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '请求数据失败'});
        } else {
            // 返回数据给客户端
            res.json({success_code: 200, message: results});
        }
    });
});

/**
 * 设置默认收货地址
 */
router.post('/api/address_default', (req, res) => {
    // 1. 验证用户
    // console.log(req.body)
    let user_id = req.session.userId;

    if(!user_id){
        res.json({err_code:0, message:'请先登录！'});
        return;
    }

    // 2. 获取客户端传过来的地址信息
    // let address_info = req.body.address_info;
    let address_id = req.body.address_id;

    // 3. 查询数据
    let sql_str = "SELECT * FROM shopping_address_list WHERE 'user_id = '" + user_id + "'";
    conn.query(sql_str, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '服务器内部错误!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            // console.log(results);
            if (results[0]) { // 3.1 地址已经存在
                // 3. 修改地址数据

                let is_default = 1;
                let add_sql = "INSERT INTO shopping_address_list(user_id, address_id, is_default) VALUES (?, ?, ?)";
                let sql_params = [user_id,address_id,is_default];
                conn.query(add_sql, sql_params, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '加入地址信息失败!'});
                    } else {
                        res.json({success_code: 200, message: '加入地址信息成功!'});
                    }
                });
            }
        }
    });
});

/**
 *删除收货地址
 * @type {Router}
 */
router.post('/api/del_address', (req, res) => {
    // 1. 验证用户
    // console.log(req.body)
    let user_id = req.session.userId;

    if(!user_id){
        res.json({err_code:0, message:'请先登录！'});
        return;
    }

    // 2. 获取客户端传过来的商品信息
    let goods_id = req.body.goods_id;

    // 3. 查询数据
    let sql_str = "SELECT * FROM shopping_address_list WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id + "' LIMIT 1";
    conn.query(sql_str, (error, results, fields) => {
        if (error) {
            res.json({err_code: 0, message: '服务器内部错误!'});
        } else {
            results = JSON.parse(JSON.stringify(results));
            // console.log(results);
            if (results[0]) { // 3.1 地址已经存在
                let sql_str = "DELETE FROM shopping_address_list WHERE goods_id = '" + goods_id + "' and user_id = '" + user_id + "' LIMIT 1";
                conn.query(sql_str, (error, results, fields) => {
                    if (error) {
                        res.json({err_code: 0, message: '删除购物车商品失败!'});
                    } else {
                        res.json({success_code: 200, message: '删除购物车商品成功!'});
                    }
                });
            }
        }
    });

})
module.exports = router;
