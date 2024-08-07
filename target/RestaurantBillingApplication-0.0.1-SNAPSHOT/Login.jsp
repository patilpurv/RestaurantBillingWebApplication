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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<body>

    <div class="container-fluid">

<form name="frm" action="loginCheck" method="post">
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
                    <div class="userin"><input type="text" name="user" required></div>
                    <div class="password"><label for="pass">Password</label></div>
                    <div class="passin"><input type="password" name="pass" required></div>
                    <div class="remember"><input type="checkbox">Remember me</div>
                    <button type="submit">Login</button>
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