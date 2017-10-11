<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CMACGM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>CMA-CGM LogIn</title>
    <!-- Bootstrap core CSS-->
    <link href="Content/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom fonts for this template-->
    <link href="Content/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom styles for this template-->
    <link href="Content/css/sb-admin.css" rel="stylesheet" />

    <style>
        .navbar-brand {
            display: block;
            text-align: center;
            margin: 30px auto 0;
        }
    </style>
    <script>
        err: {
                container: 'popover'
        }
    </script>
</head>
<body class="bg-white">
    <div class="container">

        <div class="navbar-brand">
            <img src="Content/img/cma-cgma-login-logo.png" alt="CMA CGM" /></div>
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">Login</div>
            <div class="card-body">
                <form runat="server">
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox runat="server" ID="Email" TextMode="Email" CssClass="form-control" data-error="Bruh, that email address is invalid" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" runat="server" id="RememberMe" type="checkbox" />
                                Remember Password</label>
                        </div>
                    </div>

                    <asp:Button CssClass="btn btn-primary btn-block" runat="server" OnClick="LogIn" Text="Log In" />
                </form>
                <div class="text-center">
                    <%--<a class="d-block small mt-3"  href="register.html">Register an Account</a>--%>
                    <%--<p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" CssClass="d-block small mt-3" ViewStateMode="Disabled">Register an Account</asp:HyperLink>
                </p>--%>
                    <%--<a class="d-block small" href="#">Forgot Password?</a>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="Content/vendor/jquery/jquery.min.js"></script>
    <script src="Content/vendor/popper/popper.min.js"></script>
    <script src="Content/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="Content/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
