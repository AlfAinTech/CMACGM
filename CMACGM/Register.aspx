<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CMACGM.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>CMA-CGM Register</title>
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
</head>
<body class="bg-white">
    <div class="container">
        <div class="navbar-brand">
            <img src="Content/img/cma-cgma-login-logo.png" alt="CMA CGM" />
        </div>
        <div class="card card-register mx-auto mt-5">
            <div class="card-header">Register an Account</div>
            <div class="card-body">
                <form runat="server">
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleInputName">First name</label>

                                <asp:TextBox runat="server" ID="tb_firstName" class="form-control" aria-describedby="nameHelp" placeholder="Enter first name"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="exampleInputLastName">Last name</label>
                                <asp:TextBox runat="server" ID="tb_lastName" class="form-control" aria-describedby="nameHelp" placeholder="Enter last name"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox runat="server" ID="Email" class="form-control" TextMode="Email" placeholder="Enter email" data-error="Bruh, that email address is invalid"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The email field is required." />
                    </div>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-6">
                                <label for="exampleInputPassword1">Password</label>
                                <asp:TextBox runat="server" ID="Password" class="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                            <div class="col-md-6">
                                <label for="exampleConfirmPassword">Confirm password</label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" class="form-control" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                            </div>
                        </div>
                    </div>

                    <asp:Button runat="server" ID="btn_Register" OnClick="btn_Register_Click" CssClass="btn btn-primary btn-block" Text="Register" />

                    </form>
                <div class="text-center">
          
                    <p>
                    <asp:HyperLink runat="server" ID="LogInHyperLink" CssClass="d-block small mt-3" ViewStateMode="Disabled">Login Page</asp:HyperLink>
                </p>
          
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
