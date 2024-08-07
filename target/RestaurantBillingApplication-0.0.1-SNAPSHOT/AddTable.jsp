<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
  .maincont .sidepage
{
    background-image: url(C:\Users\purva\Downloads\img\cafebackgroung.jpeg);
	background-position: center;
    background-size: cover;
}
h5
{
color:white;
margin-left:450px;
padding-top:50px;

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
document.getElementById("s").innerHTML="invalid String";
document.getElementById("s").style.backgroundColor="white";
document.getElementById("s").style.color="red";

    }	
 }
function idValidate(str)
{
    let pattern=/^[0-9]+$/g
        let result=pattern.test(str);
        if(result)
        {
     document.getElementById("h").innerHTML="";
        }
        else{
  document.getElementById("h").innerHTML="invalid table id ";
  document.getElementById("h").style.backgroundColor="white";
  document.getElementById("h").style.color="red";
        }

}

</script>
</head>
<body>
   <%@ include file="Dashboard.jsp" %>
   <div class="col  py-3 main">           
        <form class="formarea" name="frm" action="AddTable" method="post">            
          <div class="form-group addcustomer">
             <div class="AddCustForm">
                <div class="addheading pt-2">
                    <h3>Add Table</h3>
                </div>
                
                <div class="inpt mt-4">
                <label>Table Id</label>
                   <input type="text" name="tid" id="tid" value="" onkeyup="idValidate(this.value)"> <h6 id="h"></h6>
                   </div>
                   <div class="inpt mt-3">
                   <label>Table Type</label>
                   <input type="text" name="ttype" id="ttype" value="" onkeyup="nameValidate(this.value)">   <h6 id="s"></h6>
                   </div>
                   <div class="inpt mt-4">
                   <label>Table Status</label>
                   <input type="text" name="status" id="status"  value="" onkeyup="nameValidate(this.value)"><h6 id="s"></h6>
                   </div>
                <div class="button mt-3 mb-3 btn">
                   <button type="submit" >Add Table</button> 
                </div>
             </div>             
          </div>       
        </form>    
           <h5>${msg}</h5>
     </div>
    </div>
</div>
  

</body>
</html>