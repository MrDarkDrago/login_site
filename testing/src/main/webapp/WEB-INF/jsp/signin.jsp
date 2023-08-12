<%-- 
    Document   : signin
    Created on : Aug 2, 2023, 9:39:20 AM
    Author     : Pasindu Theekshana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register</title>
        <link rel="stylesheet" href="assets/CSS/sign.css">


        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous">

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous">
        </script>

  

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-XXXXX" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>

    </head>
    <body class="body">

        <div class="container">
            <div class="row">
                <div class="col note">

                    <h1 class="comp_name">Sign in to Account</h1>
                </div>

                <div class="col">
                    <div class="row row1">
                        <div class="col"></div>
                    </div>

                    <div class="form1" method="post">
                        <div class="form-group">
                            <h1>Register</h1>
                        </div>

                        <div class="form-group">
                            <input class="form-control" type="text" id="fname" placeholder="First Name"><br>

                            <input class="form-control" type="text" id="lname" placeholder="Last Name"><br>

                            <input class="form-control" type="text" id="Mobile" placeholder="Mobile Number"><br>

                            <input class="form-control" type="text" id="email" placeholder="email"><br>

                            <input class="form-control" type="password" id="password" placeholder="password"><br>

                            <input class="form-control" type="password" id="c_password" placeholder="confirm password"><br>

                            <small>Already have an account, <a href="login_user">login</a></small><br>

                            <button class="btn btn-primary" type="submit" id="register">Register</button><br>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <script>
                document.getElementById('register').addEventListener('click', function (abc) {
                    var fname = document.getElementById('fname').value;
                    var lname = document.getElementById('lname').value;
                    var mobile = document.getElementById('Mobile').value;
                    var email = document.getElementById('email').value;
                    var password = document.getElementById('password').value;
                    var c_password = document.getElementById('c_password').value;

                    fetch('getSignin', {
                        method: 'POST',
                        body: new URLSearchParams({
                            fname_backend: fname,
                            lname_backend: lname,
                            mobile_backend: mobile,
                            email_backend: email,
                            password_backend: password,
                            c_password_backend: c_password
                        })
                    })

                            .then((res) => res.text())
                            .then(function (res) {
                                try {
                                    Swal.fire({
                                        icon: 'success',
                                        title: res
                                    });
//                            const parsedData = JSON.parse(res);

                                } catch (error) {

                                }
                            });
                });
        </script>
    </body>

</html>