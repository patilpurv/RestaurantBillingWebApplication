<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Restaurant</title>
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
    let pattern=/^[0-9]{1,2}$/;
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
<body onload="showMessage()">
	<%@ include file="Dashboard.jsp"%>
	<div class="col  py-3 main">
		<form class="formarea" name="frm" action="AddTable" method="post">
			<div class="form-group addcustomer">
				<div class="AddCustForm">
					<div class="addheading pt-2">
						<h3>Add Table</h3>
					</div>
					<table>
						<tr>
							<div class="inpt mt-4">
								<td><label>Table Id</label></td>
								<td>: <input type="text" name="tid" id="tid" value=""
									onkeyup="idValidate(this.value)" required>
									<h6 id="h"></h6></td>
							</div>
						</tr>

						<tr>
							<div class="inpt mt-3">
								<td><label>Table Type</label></td>
								<td>: <input type="text" name="ttype" id="ttype" value=""
									onkeyup="nameValidate(this.value)" required>
									<h6 id="s"></h6></td>
							</div>
						</tr>

						<tr>
							<div class="inpt mt-4">
								<td><label>Table Status</label></td>
								<td>: <input type="text" name="status" id="status" value=""
									onkeyup="nameValidate(this.value)" required>
									<h6 id="s"></h6></td>
							</div>
						</tr>
					</table>
					<div class="button mt-3 mb-3 btn">
						<button type="submit">Add Table</button>
					</div>
					<h5 id="automatic" style="color: black; text-align: center"></h5>
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>
	<%
	String msg = (String) request.getAttribute("msg");

	if (msg != null) {
	%>
	<script>
    	 function showMessage() {    		
    		    var hideElement=document.getElementById("automatic");
    		    var originalText=hideElement.innerHTML;
    		    var typeMessage="<%=msg%>
		";
			if (typeMessage) {
				hideElement.innerHTML = typeMessage;
				setTimeout(function() {
					hideElement.innerHTML = originalText;
				}, 5000);
			}
		}
	</script>
	<%
	}
	%>
</body>
</html>
===============================================================  --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
   .form-container {
        background-color: white;
        width:100%;
        max-width: 600px;
        margin: auto;
        box-shadow: 5px 5px 5px grey;
        border-radius: 8px;
    }
    .form-container .addheading {
        background-color: rgb(128, 0, 64);
        text-align: center;
        color: white;
        padding: 1em;
    }
    .form
    {
       padding: 1em;
    }
    
    .form-container input {
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
    /* .form-container .btn {
        display: block;
        margin: auto;
        text-align: center;
    }
    .form-container .btn button {
        background-color: rgb(128, 0, 64);
        color: white;
        outline: none;
        border: none;
        padding: 0.5em 2em;
    } */
    .msg {
        text-align: center;
        color: red;
    }
</style>
<script type="text/javascript">
function validateType(str) {
    let pattern = /^[a-zA-Z]+$/;
    let result = pattern.test(str);
    if (result) {
        document.getElementById("s").innerHTML = "";
    } else {
        document.getElementById("s").innerHTML = "invalid type";
        document.getElementById("s").style.backgroundColor = "white";
        document.getElementById("s").style.color = "red";
    } 
}

/* function validateId(str) {   
    let pattern = /^\d+$/;
    let result = pattern.test(str);
    if (result) {
        document.getElementById("ss").innerHTML = "";
    } else {
        document.getElementById("ss").innerHTML = "invalid id";
        document.getElementById("ss").style.backgroundColor = "white";
        document.getElementById("ss").style.color = "red";
    } 
} */

function validateStatus(str) {
    let pattern = /^[a-zA-Z]+$/;
    let result = pattern.test(str);
    if (result) {
        document.getElementById("h").innerHTML = "";
    } else {
        document.getElementById("h").innerHTML = "invalid status";
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
<body>
<%@ include file="Dashboard.jsp" %>

<div class="container mt-5">
    <div class="form-container">
        <div class="addheading">
            <h3>Add Table</h3>
        </div>
        <form class="form"  name="frm" action="AddTable" method="post">
            <div class="form-group row">
                <label for="Tid" class="col-sm-4 col-form-label">Table ID</label>
                 <div class="col-sm-8">
                <input type="text" class="form-control" name="tid" id="Tid" oninput="validateIntegerInput(this)" pattern="\d*" title="Only integers are allowed" required> <!-- onkeyup="validateId(this.value)" --> 
                <div id="ss" class="msg"></div>
                </div>
            </div>
            <div class="form-group row">
                <label for="Type"  class="col-sm-4 col-form-label">Table Type</label>
                <div class="col-sm-8">
                <input type="text" class="form-control" name="ttype" id="Type" onkeyup="validateType(this.value)" required>
                <div id="s" class="msg"></div>
                </div>
            </div>
            <div class="form-group row">
                <label for="Status"  class="col-sm-4 col-form-label">Table Status</label>
                <div class="col-sm-8">
                <input type="text" class="form-control" name="status" id="Status" onkeyup="validateStatus(this.value)" required>
                <div id="h" class="msg"></div>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn" style="background-color: rgb(128, 0, 64);
        color: white;
        outline: none;
        border: none;
        padding: 0.5em 2em;">Add Table</button>
            </div>
            <div class="msg"><h6>${msg}</h6></div>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>