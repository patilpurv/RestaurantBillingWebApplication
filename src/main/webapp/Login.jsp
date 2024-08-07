<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<link rel="stylesheet" href="CSS/login.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>

</head>
<body>
	<%
	session = request.getSession();
	session.invalidate();
	%>
	<div class="container-fluid">

		<form name="frm" action="loginCheck" method="post">
			<div class="row cont"
				style="background-image: url(img/table-plate.jpg);">
				<div class="row Name">
					<div class="col-3"></div>
					<div class="col-6 header">
						<div class="logo">
							<img src="img/logoRes.jpg" alt="logo">
						</div>
						<h1>
							Unique Restaurant Food <br>Billing App
						</h1>
					</div>
					<div class="col-3"></div>
				</div>

				<div class="row mt-3 ">
					<div class="col-4"></div>
					<div class="col-4 head pt-2 mb-0">
						<h6>Login here</h6>
					</div>
					<div class="col-4"></div>
				</div>
				<div class="row main ">

					<div class="col-4"></div>

					<!--login form div-->
					<div class="col-4 login">

						<!--input id pass-->
						<div class="row inpt">
							<div class="col-12">
								<div class="user">
									<label for="log">User Name</label>
								</div>
								<div class="userin">
									<input type="text" name="user" required>
								</div>
								<div class="password">
									<label for="pass">Password</label>
								</div>
								<div class="passin">
									<input type="password" name="pass" required>
								</div>
								<div class="remember">
									<input type="checkbox">Remember me
								</div>
								<div class="btn"
									style="border: none; text-align: center; width: 30%; border-redius: 6%; display: block; margin: auto;">
									<button type="submit"
										style="background-color: brown; width: 60%; border-redius: 6%; border: none; color: white; height: 6vh;">Login</button>
								</div>
								<%
								if (request.getAttribute("loginFailed") != null) {
								%>
								<h2>Login failed</h2>
								<%
								}
								%>
								<div class="forget">
									<a href="/ForgetPssword.html">Forget passwowrd?</a>
								</div>
							</div>
						</div>

						<div class="col-4"></div>
					</div>
				</div>

				<div class="row slogan mt-4">
					<div class="col-12">
						<p>Unique restaurant have a Unique test.....!</p>
					</div>
				</div>
			</div>
		</form>
	</div>


</body>
</html>

<%-- 
=====================================================================

 
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Insert title here</title>
 <script type="text/javascript">
 function validateName() {
	    var str = document.getElementById("userName").value;
	    var regExp = /^[a-zA-Z]+$/;
	    if (!regExp.test(str)) {
	        alert("Please enter characters only for username.");
	    }
	}
   
   function validatePass(){
	   var str=document.getElementById("passWord").value;
	   var regExp=/Admin/;
	   var result=str.match(regExp);
	   if(result==null)
		   {
		      alert("Invalid password");
		   }
	   
   }
 </script>
<link rel="stylesheet" href="CSS/login.css">
<link rel="stylesheet" href="CSS/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<body>

    <div class="container-fluid">

<form name="frm" action='login' method="post">

        <div class="row cont" style=" background-image: url(img/table-plate.jpg);">
            <div class="row Name">
         <div class="col-3"></div>
            <div class="col-6 header">
                <div class="logo">
                    <img src="img/logoRes.jpg" alt="logo">
                 </div>
                 <h1>Unique Restaurant Food <br>Billing App</h1>
            </div>
            <div class="col-3"></div>
        </div>

        <div class="row mt-3 ">
            <div class="col-4"></div>
            <div class="col-4 head pt-2 mb-0"><h6>Login here</h6></div>
            <div class="col-4"></div>
        </div>
            <div class="row main ">

                <div class="col-4"></div>

                <!--login form div-->
                <div class="col-4 login">
                      
                    <!--input id pass-->
                    
                    <div class="row inpt">
                        <div class="col-12">
                    <div class="user"><label for="log">User Name</label></div>
                    <div class="userin"><input type="text" name="user" value="" id="userName" onkeyup='validateName()' required></div>
                    <!--<p id="vname"></p>-->
                    <div class="password"><label for="pass">Password</label></div>
                    <div class="passin"><input type="password" name="pass" value="" id="passWord" required></div>
                    <div class="remember"><input type="checkbox">Remember me</div>
                     <div class="btn" style=" border: none;
    text-align: center;
    width: 30%;
    border-radius: 6%;
    display: block;
    margin: auto;" ><button type="submit" onclick='validatePass()' style="background-color:brown; width: 60%;
    border-radius: 6%; border: none; color:white; height:5vh;">login</button></div>
                    <div class="forget"><a href="/ForgetPssword.html">Forget passwowrd?</a></div>
                   
                    </div> 

                    </div>
               
                    <div class="col-4"></div>
                </div>
                </div>

                <div class="row slogen mt-4">
                    <div class="col-12">
                        <p>Unique restaurant have a Unique test.....!</p>
                    </div>
                </div>
            </div>
        </form>
        </div>
   

</body>
</html>




 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validateName() {
    var str = document.getElementById("userName").value;
    var regExp = /^[a-zA-Z]+$/;
    if (!regExp.test(str)) {
        alert("Please enter characters only for username.");
    }
}

function validatePass() {
    var str = document.getElementById("passWord").value;
    var regExp = /Admin/;
    var result = str.match(regExp);
    if (result == null) {
        alert("Invalid password");
    }
}
</script>
 <link rel="stylesheet" href="CSS/login.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>

<div class="container-fluid">
    <form name="frm" action='login' method="post">
        <div class="row cont" style="background-image: url(img/table-plate.jpg); background-size: cover; background-position: center;">
            <div class="row Name text-center">
                <div class="col-12 col-md-3"></div>
                <div class="col-12 col-md-6 header">
                    <div class="logo">
                        <img src="img/logoRes.jpg" alt="logo" class="img-fluid" style="max-width: 100px;">
                    </div>
                    <h1>Unique Restaurant Food <br>Billing App</h1>
                </div>
                <div class="col-12 col-md-3"></div>
            </div>

            <div class="row mt-3">
                <div class="col-12 text-center head pt-2 mb-0" style="width:34%; margin:auto;">
                    <h6>Login here</h6>
                </div>
            </div>

            <div class="row main justify-content-center">
                <div class="col-12 col-md-6 col-lg-4 login">
                    <div class="row inpt">
                        <div class="col-12">
                            <div class="user"><label for="log">User Name</label></div>
                            <div class="userin"><input type="text" name="user" value="" id="userName" onkeyup='validateName()' required class="form-control"></div>
                            <div class="password mt-3"><label for="pass">Password</label></div>
                            <div class="passin"><input type="password" name="pass" value="" id="passWord" required class="form-control"></div>
                            <div class="remember mt-3"><input type="checkbox"> Remember me</div>
                            <div class="btn d-grid text-center mt-3">
                                <button type="submit" onclick='validatePass()' class="btn" style="background-color: brown; color: white;">Login</button>
                            </div>
                            <div class="forget text-center mt-2"><a href="/ForgetPssword.html">Forget password?</a></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row slogen mt-4">
                <div class="col-12 text-center">
                    <p>Unique restaurant have a Unique taste.....!</p>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
--%>