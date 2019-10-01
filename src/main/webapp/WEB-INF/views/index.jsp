<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        body {
            font-family: "Quicksand", sans-serif;
        }

        .curved {
            padding: 5px;
            margin-bottom: 15px;
            border: 0;
            border-radius: 0 30px 30px 0;
            color: #818181;
        }

        .curved:hover {
            background: #ffecb3;
        }

        h2 {
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        h3 {
            text-decoration: none;
            font-size: 20px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }


        .titlebtn {
            font-size: 15px;
            cursor: pointer;
            background-color: transparent;
            color: black;
            padding: 10px 15px;
            border: none;
        }

        .fab-btn {
            position: fixed;
            border-radius: 10px;
            box-shadow: 15px 15px 25px grey;
            bottom: 15px;
            right: 15px;
            font-size: 25px;
            cursor: pointer;
            background-color: #ffc107;
            color: black;
            padding: 10px 15px;
            border: none;
            outline: none;
        }

        .btn-note {
            background-color: #ffc107;
            color: black;
        }

        .fab-btn:focus {
            outline: none;
        }

        /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
    </style>
    <title>Keep Note</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <button class="titlebtn" onclick="toggleNav()"><i class="material-icons">
            menu
        </i></button>
        <img style="height: auto; width: auto; padding: 5px"
             src="https://www.gstatic.com/images/branding/product/1x/keep_48dp.png" alt="">
        <h2 style="margin-top: auto; margin-bottom: auto">Keep</h2>
        <div class="flex-grow-1 flex-1-1-auto d-flex"></div>
        <button class="titlebtn"><i class="material-icons">
            more_vert
        </i></button>
    </div>
    <div class="row" style="background: #818181; height: 1px; width: 100%; margin:0"></div>
    <div class="row" style="height: 10px;"></div>
    <div class="row">
        <div class="d-none d-lg-block d-xl-block col-3">
            <div class="container" style="padding: 10px">
                <div class="row curved">
                    <div style="width: 30px"></div>
                    <i class="material-icons">
                        emoji_objects
                    </i>
                    <div style="width: 50px"></div>
                    <h3>
                        All Notes
                    </h3>
                </div>
                <div class="row curved">
                    <div style="width: 30px"></div>
                    <i class="material-icons">
                        notifications_active
                    </i>
                    <div style="width: 50px"></div>
                    <h3>Reminders</h3>
                </div>
                <div class="row"
                     style="width: 100%; height: 1px; background: #a1a1a1; margin: 5px 0 10px;"></div>
                <div class="row curved">
                    <div style="width: 30px"></div>
                    <i class="material-icons">
                        settings
                    </i>
                    <div style="width: 50px"></div>
                    <h3>
                        Settings
                    </h3>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="container">
                <div class="row" style="height: 15px"></div>
                <div class="row">
                    <c:forEach items="${notes}" var="n">
                        <div class="col-4">
                            <div class="card h-100" style="margin-bottom: 10px">
                                <div class="card-body">
                                    <div class="row">
                                        <h5 class="card-title">${n.noteTitle}</h5>
                                        <div class="d-flex flex-1-1-auto flex-grow-1"></div>
                                        <form  method="get" action="deleteNote">
                                            <input name="id" class="d-none" value="${n.noteId}"  path="id"/>
                                            <button type="submit" value="Submit" class="btn"><i style="color: #818181" class="material-icons">delete</i></button>
                                        </form>
                                    </div>
                                    <h6 class="card-subtitle mb-2 text-muted">#${n.noteId}</h6>
                                    <p class="card-text">${n.noteContent}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<button class="fab-btn" data-toggle="modal" data-target="#exampleModalCenter">+note</button>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">New note!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form modelAttribute="note" action="saveNote" method="get">
                <div class="modal-body">
                    <div class="form-group row">
                        <form:label class="col-sm-2 col-form-label" path="noteId">Id:</form:label>
                        <div class="col-sm-10">
                            <form:input path="noteId" type="number" class="form-control" placeholder="Note Id"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label class="col-sm-2 col-form-label" path="noteTitle">Title:</form:label>
                        <div class="col-sm-10">
                            <form:input path="noteTitle" type="text" class="form-control" id="title"
                                        placeholder="Note Title"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label class="col-sm-2 col-form-label" path="noteContent">Content:</form:label>
                        <div class="col-sm-10">
                            <form:textarea path="noteContent" type="text" class="form-control" id="content"
                                           placeholder="Note Content" rows="3"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label class="col-sm-2 col-form-label" path="noteStatus">Status:</form:label>
                        <div class="col-sm-10">
                            <form:input path="noteStatus" type="text" class="form-control" id="status"
                                        placeholder="Note Status"/>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" value="Submit" class="btn btn-note">Save note!</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<script type="application/javascript">
    let isOpen = true;

    function toggleNav() {
        if (isOpen) {
            document.getElementById("mySidebar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            isOpen = false;
        } else {
            document.getElementById("mySidebar").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
            isOpen = true;
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"
        type="application/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        type="application/javascript" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"
        type="application/javascript"></script>
</body>
</html>

