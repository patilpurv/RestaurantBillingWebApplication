<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.resbill.model.*,org.resbill.repository.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.maincont .sidepage {
	background-image: url(C:\Users\purva\Downloads\img\cafebackgroung.jpeg);
	background-position: center;
	background-size: cover;
}
</style>
<link rel="stylesheet" href="CSS/AddCustomer.css">
<script type="text/javascript">


function nameValidate(str)
{
let pattern= /^[a-zA-Z\s]+$/g;
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
	let pattern=/^[6-9]{1}\d{9}$/;
      let result=str.match(pattern);
      if(result!=null)
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
<body onload="showMessage()">
	<%@ include file="Dashboard.jsp"%>
	<div class="col  py-3 main">
		<form class="formarea" name="frm" action="customer" method="post">
			<div class="form-group addcustomer">
				<div class="AddCustForm">
					<div class="addheading pt-2 ">
						<h3>Add Customer</h3>
					</div>

					<table>
						<tr>
							<div class="inpt mt-4">
								<td><label>Customer Name</label></td>
								<td>: <input type="text" name="name" id="name" value=""
									onkeyup="nameValidate(this.value)" required>
									<h6 id="s"></h6></td>

							</div>
						</tr>

						<tr>
							<div class="inpt mt-3">
								<td><label>Customer Contact</label></td>
								<td>: <input type="text" name="contact" id="contact"
									value="" onkeyup="contactValidate(this.value)" required>
								<h6 id="h"></h6></td>
							</div>
						</tr>

						<tr>
							<div class="inpt mt-3">
								<td><label>Table Id</label></td>
								<td>: <input type="text" name="tid" id="tid" required></td>
							</div>
						<tr>
					</table>
					<div class="button mt-3 mb-3 btn">
						<%
						ItemRepositoryImpl irepo = new ItemRepositoryImpl();
						int Oid = irepo.maualOid();
						%>
						<input type="hidden" name="Oid" value="<%=(int) Oid%>">
						<button type="submit">Add Customer</button>

					</div>
					<h5 id="automatic" style="padding-left: 150px;"></h5>
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>
	<%
	String successMessage = (String) request.getAttribute("successMessage");

	if (successMessage != null) {
	%>
	<script>
    	 function showMessage() {    		
    		    var hideElement=document.getElementById("automatic");
    		    var originalText=hideElement.innerHTML;
    		    var typeMessage="<%=successMessage%>
		";
			if (typeMessage) {
				hideElement.innerHTML = typeMessage;
				setTimeout(function() {
					hideElement.innerHTML = originalText;
				}, 2000);
			}
		}
	</script>
	<%
	}
	%>
</body>
</html> 
===================================================================
 --%><%-- 
<!DOCTYPE html>
<%@ page import="org.resbill.model.*,org.resbill.repository.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.maincont .sidepage {
	background-image: url(C:\Users\purva\Downloads\img\cafebackgroung.jpeg);
	background-position: center;
	background-size: cover;
}

/* Responsive CSS */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.formarea {
    max-width: 600px;
    margin: 0 auto;
    
}

.addcustomer {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.AddCustForm {
    width: 100%;
    background-color: #f9f9f9;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    border-radius: 8px;
}
.addheading
{
    background-color: rgb(128, 0, 64);
    color:white;
    width:100%;
    
}
.addheading h3 {
    
    text-align: center;
    padding-bottom:5px;
}

.table-wrapper {
    width: 100%;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

td {
    padding: 10px;
}

.inpt {
    display: flex;
    flex-direction: column;
    margin-bottom: 15px;
    background-color:black;
}
.inpt label {
    margin-bottom: 5px;
}
.inpt input {
    padding: 10px;
    font-size: 16px;
    border: none;
	border-bottom: 1px solid black;
    border-radius: 4px;
}
button {
    background-color: rgb(128, 0, 64);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    margin :auto;
}
button:hover {
   background-color: rgb(72, 0, 36);  
}
#automatic {
    text-align: center;
    margin-top: 20px;
}

/* Media Queries */
@media (max-width: 768px) {
    .addheading h3 {
        font-size: 24px;
    }

    table, .inpt {
        flex-direction: column;
        align-items: flex-start;
    }

    td {
        width: 100%;
        padding: 5px;
    }

    .inpt input {
        width: 100%;
        box-sizing: border-box;
    }
}
</style>
<script type="text/javascript">

function nameValidate(str) {
    let pattern = /^[a-zA-Z\s]+$/g;
    let result = pattern.test(str);
    if (result) {
        document.getElementById("s").innerHTML = "";
    } else {
        document.getElementById("s").innerHTML = "invalid name";
        document.getElementById("s").style.backgroundColor = "white";
        document.getElementById("s").style.color = "red";
    }
}
function contactValidate(str) {
    let pattern = /^[6-9]{1}\d{9}$/;
    let result = str.match(pattern);
    if (result != null) {
        document.getElementById("h").innerHTML = "";
    } else {
        document.getElementById("h").innerHTML = "invalid Mobile Number ";
        document.getElementById("h").style.backgroundColor = "white";
        document.getElementById("h").style.color = "red";
    }
}
</script>
</head>
<body onload="showMessage()">
    <%@ include file="Dashboard.jsp"%>
    <div class="col py-3 main">
        <form class="formarea" name="frm" action="customer" method="post">
            <div class="form-group addcustomer">
                <div class="AddCustForm">
                    <div class="addheading pt-2">
                        <h3>Add Customer</h3>
                    </div>
                    <div class="table-wrapper">
                        <table>
                            <tr>
                                <div class="inpt mt-4">
                                    <td><label>Customer Name</label></td>
                                    <td>: <input type="text" name="name" id="name" value=""
                                        onkeyup="nameValidate(this.value)" required style=" border: none;
	border-bottom: 1px solid black;">
                                        <h6 id="s"></h6>
                                    </td>
                                </div>
                            </tr>
                            <tr>
                                <div class="inpt mt-3">
                                    <td><label>Customer Contact</label></td>
                                    <td>: <input type="text" name="contact" id="contact"
                                        value="" onkeyup="contactValidate(this.value)" required style=" border: none;
	border-bottom: 1px solid black;">
                                    <h6 id="h"></h6>
                                    </td>
                                </div>
                            </tr>
                            <tr>
                                <div class="inpt mt-3">
                                    <td><label>Table Id</label></td>
                                    <td>: <input type="text" name="tid" id="tid" required style=" border: none;
	border-bottom: 1px solid black;"></td>
                                </div>
                            </tr>
                        </table>
                    </div>
                    <div class="button mt-3 mb-3 btn">
                        <%
                        ItemRepositoryImpl irepo = new ItemRepositoryImpl();
                        int Oid = irepo.maualOid();
                        %>
                        <input type="hidden" name="Oid" value="<%=(int) Oid%>">
                        <button type="submit">Add Customer</button>
                    </div>
                    <h5 id="automatic" style="padding-left: 150px;"></h5>
                </div>
            </div>
        </form>
    </div>
    <%
    String successMessage = (String) request.getAttribute("successMessage");

    if (successMessage != null) {
    %>
    <script>
         function showMessage() {    		
                var hideElement=document.getElementById("automatic");
                var originalText=hideElement.innerHTML;
                var typeMessage="<%=successMessage%>
            ";
            if (typeMessage) {
                hideElement.innerHTML = typeMessage;
                setTimeout(function() {
                    hideElement.innerHTML = originalText;
                }, 2000);
            }
        }
    </script>
    <%
    }
    %>
</body>
</html>
======================================================== --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.resbill.model.*,org.resbill.repository.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
   .formarea {
     background-color: white;
     width: 100%;
     max-width: 600px;
     margin: auto;
     box-shadow: 5px 5px 5px grey;
     border-radius: 8px;
   }
   .addheading {
    background-color: rgb(128, 0, 64);
    text-align: center;
    padding: 1em;
    color: white;
    border-radius: 8px 8px 0 0;
   }
   .form {
      padding:1em;
   }
   .form-group input {
     padding: 1em;
     outline: none;
     border: none;
     border-bottom: 1px solid black;
     width: 100%;
     margin-bottom: 1em;
   }
   button {
       background-color:  rgb(128, 0, 64);
       color: white;
       outline: none;
       border: none;
       padding: 0.5em 1em;
       border-radius: 4px;
   }
   .msg {
      text-align: center;
      color: red;
   }
</style>

<script type="text/javascript">
function nameValidate(str) {
    let pattern = /^[a-zA-Z]+(?: [a-zA-Z]+)*$/;
    let result = pattern.test(str);
    if (result) {
        document.getElementById("s").innerHTML = "";
    } else {
        document.getElementById("s").innerHTML = "invalid name";
        document.getElementById("s").style.backgroundColor = "white";
        document.getElementById("s").style.color = "red";
    }    
}

function contactValidate(str) {
    let pattern = /^[6-9]{1}\d{9}$/;
    let result = str.match(pattern);
    if (result != null) {
        document.getElementById("h").innerHTML = "";
    } else {
        document.getElementById("h").innerHTML = "invalid Mobile Number ";
        document.getElementById("h").style.backgroundColor = "white";
        document.getElementById("h").style.color = "red";
    }
    function validateIntegerInput(input) {
        // Replace any non-digit character with an empty string
        input.value = input.value.replace(/\D/g, '');
    }
}
</script>

</head>
<body onload="showMessage()">

<%@ include file="Dashboard.jsp"%>
<div class="container mt-5">
    <div class="formarea ">
        <div class="addheading mb-4">
            <h3>Add Customer</h3>
        </div>
        <form class="form" name="frm" action="customer" method="post">
            <div class="form-group row">
                <label for="name" class="col-sm-4 col-form-label">Customer Name</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="name" id="name" value=""
                        onkeyup="nameValidate(this.value)" required>
                    <div id="s" class="msg"></div>
                </div>
            </div>
            <div class="form-group row">
                <label for="contact" class="col-sm-4 col-form-label">Customer Contact</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="contact" id="contact" value=""
                        onkeyup="contactValidate(this.value)" required>
                    <div id="h" class="msg"></div>
                </div>
            </div>
            <div class="form-group row">
                <label for="tid" class="col-sm-4 col-form-label">Table Id</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="tid" id="tid" oninput="validateIntegerInput(this)" pattern="\d*" title="Only integers are allowed" required>
                </div>
            </div>
            <%
            ItemRepositoryImpl irepo = new ItemRepositoryImpl();
            int Oid = irepo.maualOid();
            %>
            <input type="hidden" name="Oid" value="<%=(int) Oid%>">
            <div class="text-center mt-4">
                <button type="submit" class="btn" style=" background-color:  rgb(128, 0, 64);
       color: white;
       outline: none;
       border: none;
       padding: 0.5em 1em;
       border-radius: 4px;">Add Customer</button>
            </div>
        </form>
        <div id="automatic" class="msg mt-3"></div>
    </div>
</div>

<%
String successMessage = (String) request.getAttribute("successMessage");

if (successMessage != null) {
%>
<script>
    function showMessage() {        
        var hideElement = document.getElementById("automatic");
        var originalText = hideElement.innerHTML;
        var typeMessage = "<%=successMessage%>";
        if (typeMessage) {
            hideElement.innerHTML = typeMessage;
            setTimeout(function() {
                hideElement.innerHTML = originalText;
            }, 2000);
        }
    }
</script>
<%
}
%>

</body>
</html>