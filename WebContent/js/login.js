 function login() {
	 var name=document.getElementById("name");
     var password=document.getElementById("password");
     var dbName=document.getElementById("dbName");
     var oError={};
     
     oError.innerHTML="<br>";
     if(oUname.value.length<6||oUname.value.length>20){
    	 oError.innerHTML='请输入6-20位的用户名';
    	 return;

     }else for(var i=0;i<oUname.value.length;i++){
    	 if(oUname.value.charCodeAt(i)>=48||oUname.value.charCodeAt(i)<=57){
    		 oError.innerHTML='请输入合法字符';
    	 	}
    	 return;
     }
     if(oUname.value.charCodeAt(0)>=48&&oUname.value.charCodeAt(0)<=57){
         oError.innerHTML='首字母不能为数字';
         return;
     }
     if(oPass.value.length<6||oPass.value.length>20){
         oError.innerHTML='请输入6-20位的密码'
         return;
     }

}