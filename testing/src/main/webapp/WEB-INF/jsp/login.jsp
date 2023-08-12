<%-- 
    Document   : login
    Created on : Aug 1, 2023, 10:49:03 AM
    Author     : Pasindu Theekshana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>

        <!--        bootstrap-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous">
        
        <link rel="stylesheet" href="assets/CSS/login.css">
        
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous">
        </script>

        <!--sweet alert-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-XXXXX" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>

    </head>
    <body class="body">
        <div class="container">
            <div class="row">

                <div class="col note">
                    <h1 class="comp_name">Login to the Account</h1>
                </div>

                <div class="col">

                    <div class="form1"  method="POST">

                        <div class="form-group">
                            <h1 class="Login">Login</h1>
                            <br>
                            <label for="exampleInputEmail1">Email address</label>
                            <input class="form-control" id="exampleInputEmail1" type="email" name="username" placeholder="username">
                        </div>
                        <br>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Password</label>
                            <input class="form-control" id="exampleInputpassword" type="password" name="password" placeholder="password">
                            <br>
                            <button type="submit" class="btn btn-primary" id="log">Log in</button>
                        </div>

                        <div>
                            <p>Don't have an account. <a href="signin">Register</a></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script>
                document.getElementById('log').addEventListener('click', function (evt) {

                    var email = document.getElementById('exampleInputEmail1').value;
                    var password = document.getElementById('exampleInputpassword').value;


                    fetch('getData', {
                        method: 'POST',
                        body: new URLSearchParams({
                            email_backend: email,
                            password_backend: password
                        })
                    })
                            .then((res) => res.text())
                            .then(function (res) {
                                try {
                                    const parsedData = JSON.parse(res);

                                    //get data from the database
                                    const user_email = parsedData.email_user;
                                    const user_password = parsedData.password_user;
                                    const user_status = parsedData.status;

                                    if (user_status === "ok") {
//                                        alert(user_status);
                                        window.location.href = 'index';
                                    } else {
                                        Swal.fire({
                                            icon: 'error',
                                            title: "Wrong User Id and Password",
                                            text: "Enter the correct user name and the password"
                                        });
                                    }
//                                    

                                } catch (error) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: "Wrong User Id and Password",
                                        text: "Enter the correct user name and the password"
                                    });
                                }
                            });



                });
        </script>


        <!--        <script src="assets/js/script.css">
           
                </script>-->
    </body>
</html>

