<%-- 
    Document   : index
    Created on : Aug 1, 2023, 9:52:12 AM
    Author     : Pasindu Theekshana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="assets/CSS/index.css">


        <!--         Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!--jQuery library--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!--Latest compiled JavaScript--> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        <!--data tables-->
        <link href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css" rel="stylesheet">

        <!--Sweet alert-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-XXXXX" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>


        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>Home</title>
    </head>
    <body>
        <div class="container" id="main">
            <table class="table" id="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Second Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
            
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">                   
                      <div class="container" id="modal_container">
                            <div class="row">
                                <div class="col">
                                    <input hidden type="text" id="up_id">
                                    <input type="text" id="up_fname"><br><br>
                                    <input type="text" id="up_lname"><br><br>
                                    <input type="text" id="up_email"><br><br>
                                    <input type="text" id="up_mobile">
                                </div>                               
                            </div>                            
                      </div>
                  </div>
                    
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="update_button">update changes</button>
                  </div>
                </div>
              </div>
            </div>
            
        </div>

        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script>
        <script src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>

        <script>
            var tableUser = $("#table").DataTable({
                "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
                "pageLength": 5, // Update the desired number of records per page
                "ordering": true,
                "autoWidth": true,
                "processing": true,
                "serverSide": true,
                "order": [[0, "desc"]],
                "searchHighlight": true,
                "searchDelay": 350,
                "responsive": true,
                "ajax": {
                    "url": "customer_data_table",
                    "contentType": "application/json",
                    "type": "POST",
                    "data": function (d) {
                        return JSON.stringify(d);
                    },
                    "dataSrc": function (response) {
                        return response.data; // Assuming your server-side script returns data property with the actual records
                    },
                    "error": function (xhr, error, code) {
                        console.log(xhr);
                        console.log(code);
                    }
                },
                "columns": [
                    {"data": "Id"},
                    {"data": "First_Name", className: "text-wrap"},
                    {"data": "Second_Name", className: "text-wrap"},
                    {"data": "Email", className: "text-wrap"},
                    {"data": "Mobile", className: "text-wrap"}
                ],
                "createdRow": function (row, data) {
                    let action_td = document.createElement('td');

                    $(action_td).append('<a href="#" class="rerec text-wrap" id="delete_user" style="padding-left:15px;"> <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. <path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg></a>');
                    $(action_td).append('<a href="#" class="rerec text-wrap" id="update_user" style="padding-left:10px;" data-toggle="modal" data-target="#exampleModalCenter"><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H322.8c-3.1-8.8-3.7-18.4-1.4-27.8l15-60.1c2.8-11.3 8.6-21.5 16.8-29.7l40.3-40.3c-32.1-31-75.7-50.1-123.9-50.1H178.3zm435.5-68.3c-15.6-15.6-40.9-15.6-56.6 0l-29.4 29.4 71 71 29.4-29.4c15.6-15.6 15.6-40.9 0-56.6l-14.4-14.4zM375.9 417c-4.1 4.1-7 9.2-8.4 14.9l-15 60.1c-1.4 5.5 .2 11.2 4.2 15.2s9.7 5.6 15.2 4.2l60.1-15c5.6-1.4 10.8-4.3 14.9-8.4L576.1 358.7l-71-71L375.9 417z"/></svg></a>');


                    $(row).append(action_td);
                }
            })
            
            $('#table').on('click', '#delete_user', function () {
                var data = tableUser.row($(this).closest('tr')).data();
                var id_front = data.Id;


                Swal.fire({
                    title: 'Are you sure?',
                    text: "This User Will be Deleted!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('delete_user', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                id_back: id_front
                            })
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            }
                            return response.json();
                        }).catch(error => {
                            Swal.showValidationMessage('Request failed:' + error);
                        });
                    },
                    allowOutsideClick: () => !Swal.isLoading()
                }).then((result) => {
                    if (result.value) {
                        if (result.value.status === 'error') {
                            Swal.fire('Error!', 'Failed to delete user', 'error');
                        } else {
                            Swal.fire('Successful!', 'User has been deleted!', 'success');
//                            refresh the table
                            tableUser.ajax.reload();
                        }
                    }
                })
            });
            
            
            
            $('table').on('click','#update_user', function (){
                var data = tableUser.row($(this).closest('tr')).data();
                var id_front = data.Id;
                var u_fname = data.First_Name;
                var u_lname =data.Second_Name;
                var u_email =data.Email;
                var up_mobile = data.Mobile;
                
                console.log(id_front);
                
                document.getElementById("up_id").value = id_front;
                document.getElementById("up_fname").value = u_fname;
                document.getElementById("up_lname").value = u_lname;
                document.getElementById("up_email").value = u_email;
                document.getElementById("up_mobile").value = up_mobile;
                
                
                
            })
            
            
            
            document.getElementById("update_button").addEventListener("click", function() {
                    
                    var u_id = document.getElementById("up_id").value;
                    var u_fname = document.getElementById("up_fname").value;
                    var u_lname = document.getElementById("up_lname").value;
                    var u_email = document.getElementById("up_email").value;
                    var up_mobile = document.getElementById("up_mobile").value;
                    
                  
                    Swal.fire({
                    title: 'Are you sure?',
                    text: "This User Will be Updated!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    showLoaderOnConfirm: true,
                    preConfirm: () => {
                        return fetch('update_user',{
                        method:'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                                    id_back : u_id,
                                    u_id_backfname_back : u_fname,
                                    u_lname_back : u_lname,
                                    u_email_back : u_email,
                                    u_mobile_back : up_mobile
                                            
                                })
                    }).then(response => {
                            if (!response.ok) {
                                throw new Error(response.statusText);
                            }else{
                                Swal.fire('Successful!', 'User has been updated!', 'success');
                                // Close the modal
                                $('#exampleModalCenter').modal('hide');
                                
                                //clear the input fields
                                document.getElementById("up_id").value = "";
                                document.getElementById("up_fname").value = "";
                                document.getElementById("up_lname").value = "";
                                document.getElementById("up_email").value = "";
                                document.getElementById("up_mobile").value = "";
                                
                                
                            //refresh the table
                            tableUser.ajax.reload();
                            }
                            return response.json();
                        }).catch(error => {
                            Swal.showValidationMessage('Request failed:' + error);
                        });
                    },
                    allowOutsideClick: () => !Swal.isLoading()
                
        })
                
                });
            
            





        </script>


    </body>
</html>
