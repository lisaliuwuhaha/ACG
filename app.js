//app.js
//1:加载模块
const express = require("express");
const pool  = require("./pool");
const qs=require("querystring")
//2:创建express对象
var app = express();
//3:指定静态目录
//服务器指定目录 绝对路径 出错
app.use(express.static(__dirname+"/public"));

//4:绑定监听端口
app.listen(3000);
//功能一:学子商城首页图片轮播
//GET /imagelist   json
app.get("/imagelist",(req,res)=>{
  var obj = [
 {id:1,img_url:"http://127.0.0.1:3000/img/banner1.png"},
 {id:2,img_url:"http://127.0.0.1:3000/img/banner2.png"},
 {id:3,img_url:"http://127.0.0.1:3000/img/banner3.png"},
 {id:4,img_url:"http://127.0.0.1:3000/img/banner4.png"},
];
  res.send(obj)
});
//功能二:首页新闻卡片
app.get("/infolist",(req,res)=>{
  //1分页
  var pno = req.query.pno;            //2
  var pageSize = req.query.pageSize;  //2
  var sql = "SELECT count(id) as c FROM info";
  var obj = {};      //保存发送客户端数据
  var progress = 0;  //进度
  pool.query(sql,(err,result)=>{
      if(err)throw err;
      var c = Math.ceil(result[0].c/pageSize);
      obj.pageCount = c;
      progress+=50;
      if(progress==100){
        res.send(obj);
      }
  });
  //2查找当前页内容
  var sql = " SELECT * FROM info LIMIT ?,?";
  pageSize = parseInt(pageSize)
  //计算分页偏移量
  var offset = parseInt((pno-1)*pageSize);   
  pool.query(sql,[offset,pageSize],(err,result)=>{
      if(err)throw err;
      obj.data = result;
      progress+=50;
      if(progress==100){
        res.send(obj);
      }
  })
});
//首页新闻卡片配套图片
// app.get('/infoimg',(req,res)=>{
//   var iid=req.query.pid;
//   var sql='SELECT img_url FROM info_img WHERE iid=?'
//   pool.query(sql,[iid],(err,result)=>{
//     if(err)throw err;
//     res.send(result)
//   })
// })

//功能四:用户发表评论

app.post("/postcomment",(req,res)=>{
   //为req对象绑定事件data   10:45
   req.on("data",(buf)=>{
     var str = buf.toString();  //1:将参数转字符串
     var obj = JSON.parse(str); //2:将参数转对象
     var msg = obj.msg;         
     var nid = parseInt(obj.nid);
     var sql = "INSERT INTO xz_comment(content,user_name,ctime,nid) VALUES(?,'匿名',now(),?)";
     pool.query(sql,[msg,nid],(err,result)=>{
       if(err)throw err;
       res.send({code:1,msg:"添加成功"});
     })
   })
})
//功能五:用户获取指定新闻编号所有评论
app.get("/getComment",(req,res)=>{
    //获取指定新闻编号
    var nid=parseInt(req.query.id);
    var pno=req.query.pno;
    var pageSize = req.query.pageSize;  //5
  //2:sql
  //2.1:查找总记录数->转换总页数  15->3
  var sql = "SELECT count(id) as c FROM xz_comment WHERE nid=?";
  var obj = {};      //保存发送客户端数据
  var progress = 0;  //进度
  pool.query(sql,[nid],(err,result)=>{
      if(err)throw err;
      var c = Math.ceil(result[0].c/pageSize);
      obj.pageCount = c;
      progress+=50;
      if(progress==100){
        res.send(obj);
      }
  });
  //2.2:查找当前页内容           中间5行
  var sql = " SELECT id,content,ctime,user_name";
     sql += " FROM xz_comment";
     sql += " WHERE nid=?";
     sql += " ORDER BY id DESC";
     sql += " LIMIT ?,?";
  var offset = parseInt((pno-1)*pageSize);   
  //计算分页偏移量
  pageSize = parseInt(pageSize)
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
      if(err)throw err;
      //console.log(result);
      obj.data = result;
      progress+=50;
      if(progress==100){
        res.send(obj);
      }

})
})
//模拟返回商品数据
app.get("/goodsinfo",(req,res)=>{
    var id=req.query.id;
    var obj={id:id,title:"华为2000",now:"99.99",old:"1999",pid:"9527"}
    res.send(obj)
  });
//功能七:购物车数据列表
app.get("/shopCart",(req,res)=>{
  var obj=[{id:1,title:"华为p10",price:3999,count:2},{id:2,title:"华为p11",price:4999,count:1},{id:3,title:"华为p12",price:5999,count:1}];
  res.send(obj)
})
//功能八:将商品信息添加至购物车
app.get("/addCart",(req,res)=>{
  var pid=req.query.pid;
  var count=req.query.count
  var reg=/^[0-9]{1,}$/
  if(!reg.test(pid)){   //如果参数验证失败
    res.send({code:-1,msg:"商品编号参数错误"})
    return;  //输出错误的信息并停止
  }
  if(!reg.test(count)){
    res.send({code:-2,msg:"商品数量参数错误"})
    return;
  }
  res.send({code:1,msg:"添加成功"})
})
//功能九:登录
app.get("/login",(req,res)=>{
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  var sql="SELECT count(id) as c FROM xz_user1 WHERE uname=? AND upwd = md5(?)";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result[0].c==0)
    res.send({code:-1,msg:"用户名或密码错误"})
    else
    res.send({code:1,msg:"登陆成功"})
  })
})

app.get("/test01",(req,res)=>{
  var id=req.query.id;
  var age=req.query.age;
  res.send(id+1+age)
})

app.get("/newlist",(req,res)=>{
  var arr=[{id:1,ctime:"2017-8-8",img_url:"http://127.0.0.1:3000/img/banner1.png",title:"今天大事",desc:"习近平抵达马尼拉 问达马尼拉 问"},{id:2,ctime:"2018-8-8",img_url:"http://127.0.0.1:3000/img/banner2.png",title:"明天大事",desc:"满洲里：开放的道路越走越宽达马尼拉 问"},{id:3,ctime:"2018-9-8",img_url:"http://127.0.0.1:3000/img/banner3.png",title:"后天大事",desc:"17种抗癌药纳入沪医保药品达马尼拉 问"}]
  res.send(arr)
})

app.post("/postProduct",(req,res)=>{
  req.on("data",(buff)=>{
    var obj=qs.parse(buff.toString())
    var pno=obj.pno;
    var price=obj.price;
    res.send({code:1,msg:":"+pno+":"+price})
  })
})
