txcms-web
========
txcms-web 是一个使用SpringMVC3.2.x, Spring JdbcTemplate & Mybatis3.2.x, HibernateValidator 5.1
构建的DEMO WEB ，方便快速搭建WEB开发平台
<br>
txweb-framework 封装了DAO, Action, Validator,常用功能
<br/>
uuola-commons 提供了工具类，如验证码，图像缩略，剪裁，和基于TOMCAT JDBC POOL 
<br>
的DB工具类.

<br/>
用户密码的安全策略<br/>

1. 用户注册提交密码信息:<br/>
	服务端存储：服务器颁发到客户端Key(K)绑定到Session, 当前使用混淆算法FuncName(F)<br/>
	表单字段：用户密码明文(A) ， 服务器颁发Key(K) 【一般为验证码值】<br/>
	客户端 加密混淆算法:  encMixFunc{F..} , 多个<br/>
	客户端值：passKey: md5( reverse( sha1(A) ) );<br/>
	POST: {'hashPassKey':encMixFunc[F](passKey),K), 'FuncName':F, 'Key':K , ... }<br/>
	
	服务端处理:<br/>
	第一步: Validate(K) 验证；<br/>
	第二部：通过 FuncName , K,  hashPassKey 解码得到 passKey.
	第三部：保存 DESede(passKey, SERVER_KEY) => encode_passKey <br/>
	
2. 用户登录校验:<br/>
	用户输入密码明文(A), 用户名(N), 验证码(K)<br/>
	客户端值：hashPassKey: sha1( md5(reverse(sha1(A))) + K);<br/>
	POST:{ 'hashPassKey':hashPassKey, 'key':K , 'name':N , ... }<br/>
	<br/>
	服务器端处理:<br/>
	第一步：Validate(K)验证；<br/>
	第二步：根据name查询 encode_passKey, 解密DESede(encode_passKey, SERVER_KEY) 得到passKey<br/>
	第三步：sha1(passKey, K) == hashPassKey 验证 <br/>
	