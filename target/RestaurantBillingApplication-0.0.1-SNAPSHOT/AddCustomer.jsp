<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .maincont .sidepage
{
    background-image: url(C:\Users\purva\Downloads\img\cafebackgroung.jpeg);
	background-position: center;
    background-size: cover;
}
</style>
<link rel="stylesheet" href="CSS/AddCustomer.css">
<script type="text/javascript">

function nameValidate(str)
{
	
    let pattern=/^[a-zA-Z]+$/g;
    let result=pattern.test(str);
    if(result)
    {
 document.getElementById("s").innerHTML="";
    }
    else{
document.getElementById("s").innerHTML="invalid name";
document.getElementById("s").style.backgroundColor="white";
document.getElementById("s").style.color="red";
    }	
 }
  function contactValidate(str)
  {
      let pattern=/^[0-9]+$/g
          let result=pattern.test(str);
          if(result!=null && str.length==10)
          {
       document.getElementById("h").innerHTML="";
          }
          else{
    document.getElementById("h").innerHTML="invalid Mobile Number ";
    document.getElementById("h").style.backgroundColor="white";
    document.getElementById("h").style.color="red";
          }

  }
</script>
</head>
<body>
   <%@ include file="Dashboard.jsp" %>
   <div class="col  py-3 main">           
        <form class="formarea" name="frm" action="customer" method="post" >            
          <div class="form-group addcustomer">
             <div class="AddCustForm">
                <div class="addheading pt-2 ">
                    <h3>Add Customer</h3>
                </div>                                     
                <div class="inpt mt-4">
                <label>Customer Name</label>
                   <input type="text" name="name" id="name" value="" onkeyup="nameValidate(this.value)"> <h6 id="s"></h6>
                   
                   </div>
                  
                   <div class="inpt mt-3">
                   <label>Customer Contact</label>
                   <input type="text" name="contact" id="contact" value="" onkeyup="contactValidate(this.value)">  <h6 id="h"></h6>
                   </div>
                   
                <div class="inpt mt-3">
                <label>Table Id</label>
                   <input type="text" name="tid" id="tid">
                </div>
                <div class="button mt-3 mb-3 btn">
                   <button type="submit">Add Customer</button> 
                </div>
             </div>             
          </div>       
        </form> 
         ${msg}      
     </div>
    </div>
</div>
  

</body>
</html>