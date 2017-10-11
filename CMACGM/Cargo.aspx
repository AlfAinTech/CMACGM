<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cargo.aspx.cs" Inherits="CMACGM.Cargo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Cargo </title>
    <!-- Bootstrap core CSS-->
    <link href="Content/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom fonts for this template-->
    <link href="Content/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom styles for this template-->
    <link href="Content/css/sb-admin.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/css/bootstrap-select.min.css" />
    <link href="Content/css/live-search-bootstrap.min.css" rel="stylesheet" />

    <style>
        .navbar-brand {
            display: block;
            text-align: center;
            margin: 30px auto 0;
        }

        .special {
            font-weight: bold !important;
            color: #fff !important;
            background: #bc0000 !important;
            text-transform: uppercase;
        }
    </style>


</head>

<body class="bg-white">


    <div class="container">


        <div class="navbar-brand">
            <img src="Content/img/cma-cgma-login-logo.png" alt="CMA CGM" /></div>
        <div class="card card-register mx-auto mt-3">
            <div class="card-header">Cargo Readiness Entry Form</div>
            <div class="card-body">
                <form runat="server">
                    <asp:ScriptManager runat="server" ID="scriptManager"></asp:ScriptManager>

                    <div class="form-group">
                        <label for="exampleInputtext1">Port of Load (POL):</label>
                        <select runat="server" id="Port" class="selectpicker" data-show-subtext="true" data-live-search="true">
                            <option ></option>
                            <option data-subtext="Rep California">Tom Foolery</option>
                            <option data-subtext="Sen California">Bill Gordon</option>
                            <option data-subtext="Sen Massacusetts">Elizabeth Warren</option>
                            <option data-subtext="Rep Alabama">Mario Flores</option>
                            <option data-subtext="Rep Alaska">Don Young</option>
                            <option data-subtext="Rep California" disabled="disabled">Marvin Martinez</option>
                        </select>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Port"
                                CssClass="text-danger" ErrorMessage="Field is required." />
                    </div>
                    <div class="form-group">
                        <label for="exampleInputtext1">LARA Partner Code:</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="tb_LaraPartnerCode" TextMode="SingleLine" placeholder="Please enter LARA Partner Code"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tb_LaraPartnerCode"
                                CssClass="text-danger" ErrorMessage="Field is required." />
                    </div>
                    <div class="form-group">
                        <label for="exampleInputtext2">Booking Ref #:</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="tb_BookingRef" TextMode="SingleLine" placeholder="Please insert Booking Ref #"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tb_BookingRef"
                                CssClass="text-danger" ErrorMessage="Field is required." />
                    </div>

                    <div class="form-group">
                        <label for="exampleInputtext3">Voyage:</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="tb_Voyage" TextMode="SingleLine" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="tb_Voyage"
                                CssClass="text-danger" ErrorMessage="Field is required." />
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlFile1">Upload Stamped Title or Dock Receipt:</label>
                        <asp:FileUpload CssClass="form-control-file" runat="server" ID="fileUploader" />
                    </div>


                    <asp:Button CssClass="btn btn-primary btn-block" Text="Submit Now" runat="server" ID="btn_Submit" OnClick="btn_Submit_Click" />
                </form>


            </div>
        </div>

        <div></div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="Content/vendor/jquery/jquery.min.js"></script>
    <script src="Content/vendor/popper/popper.min.js"></script>
    <script src="Content/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="Content/vendor/jquery-easing/jquery.easing.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

</body>
</html>
