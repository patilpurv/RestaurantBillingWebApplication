<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
.features
{
    background-image: url("img/back.jpg");
    background-repeat: no-repeat;
    background-size: cover;
   height:50vh ;
   position: relative;
   background-position: center;
   background-size: 100%;
  background-color: rgba(0,0,0,0.55);
  background-blend-mode: darken;
}

</style>
</head>
<body>

<!--NavBar-->
   <div class="container-fluid">
     
        <div class="row nav">
            <div class=" col-md-2 logo">
                <img src="img/logoRes.jpg" alt="logo">
            </div>
            <div class="  col-md-3 empty"></div>
            <div class="  col-md-7  menu pt-4">
                <div class="row ul">
                   <div class=" col-md-2 li"><a href="index.html">Home</a></div>
                   <div class=" col-md-2 li"><a href="#ftr">features</a></div>
                   <div class=" col-md-2 li"><a href="#">About Us</a></div>
                   <div class=" col-md-2 li"><a href="#Contact">Contact</a></div>
                   <div class=" col-md-2 li"><a href="Login.jsp">Login</a></div>  
            </div>
            </div>
          </div>
        
          <div class="row welcome">
            <div class="col-md-12 pt-2">
                <h2>Where every flavour tells a story!!</h2>
            </div>
        </div>
      

        <div class="row containt">
            <div class="row carousel">
            <div class="col-md-12 slider mt-1">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active ">
                        <img src="img/Puranpoli.jpg" class="d-block w-100 img-fluid" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                          <h5>Maharashtriyan Puranpoli Special</h5>
                          <p>Savoring the delisious Maharashtriyan Puranpoli</p>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <img src="img/idalidosa.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                          <h5>South Indian Idali Dosa Special</h5>
                          <p>Simple and healthy southern cousines</p>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <img src="img/pabjab.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                          <h5>Panjab Specials</h5>
                          <p>Decadent and nutrisiou Panjab special cousines</p>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <img src="img/kathiyavadi.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                          <h5>kathiyavadi special</h5>
                          <p>Represents the special spice of kathiyavadi</p>
                        </div>
                      </div>
                      
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>
            </div>
        </div>

           <div class="row features header2 mt-2" id="ftr">
          
                    <div class="col-md-7 title mt-5 ">
                         <h1>OUR FEATURES</h1>
                         <p class="line">_________________________________________________________</p>
                         <p class="cap">Provides easy managment of customers,ordersans collection</p>
                    </div>
           </div>


           <div class=" row feature_Cont mt-4">
            <div class="col-md-1"></div>
            <div class="col-md-5 ftrimg">
              <img src="img/order-removebg-preview.png" alt="orders">
          </div>
          <div class="col-md-6 pt-5">
              <h3>Easy Orders</h3>
             <p> With an easy and user friendly functionality<br> let your customer to give their feavrait food orders <br>without any acomplications</p>
                  </div>
           </div>

           <div class=" row feature_Cont mt-5">
            <div class="col-md-1"></div>
           
            <div class="col-md-5 pb-2 ftrimg">
              <img src="img/custMang-removebg-preview.png" alt="orders">
          </div>
          <div class="col-md-6 pt-5">
            <h3>Customer Managment</h3>
           <p> can add Customers, view their data,<br> ther ordes and other things<br> so reportings can be handel easily</p>
              
        </div>
           </div>

           <div class=" row feature_Cont mt-4">
            <div class="col-md-1"></div>
            <div class="col-md-5 ftrimg">
              <img src="img/tables-removebg-preview.png" alt="orders">
          </div>
          <div class="col-md-6 pt-4">
              <h3>Table Managments</h3>
             <p> Can manage the tables in the restraurnt,<br> add new tables,view the status of the tables<br> suserving to the customers makes easy</p>
                  </div>
           </div>

           <div class=" row feature_Cont mt-4">
            <div class="col-md-1"></div>
            <div class="col-md-5 ftrimg">
              <img src="img/collections.png" alt="orders">
          </div>
          <div class="col-md-6 ">
              <h3>Collections</h3>
             <p>Give repots of of all the collections <br>can see the day wise collection <br> can see themonth wisecollection<br>and also can see the customer wise collections </p>
                  </div>
           </div>

           <div class="row footer mt-4 pt-3" id="Contact">
            <div class="col-md-2"></div>
           
            <div class="col-md-8">
                <h2>Countact With US</h2>
                <p></p>
                <ul>
                  <li><a href="#"><img src="img/telephone.png" alt=""></a></li>
                  <li><a href="#"><img src="img/social.png" alt=""></a></li>
                  <li><a href="#"><img src="img/linkedin.png" alt=""></a></li>
                  <li><a href="#"><img src="img/whatsapp.png" alt=""></a></li>
                  <li><a href="#"><img src="img/mail.png" alt=""></a></li>
                </ul>
                <h6>Terms of uses: Privacy policy</h6>
            </div>
            <div class="col-md-2"></div>
         
        </div>
        <div class="row copyright">
          <p>Copyright@5348DHGrr48</p>
        </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    

</body>
</html>
