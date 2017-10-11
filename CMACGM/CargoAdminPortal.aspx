<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargoAdminPortal.aspx.cs" Inherits="CMACGM.CargoAdminPortal" %>

<!DOCTYPE html>
<script type="text/javascript">
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form runat="server">
    <div class="row" style="border-bottom:1px solid lightgrey">
        <div class="col-md-1">
            <a class="navbar-brand" href="#"><img src="Content/img/cma-cgma-logo.png" alt="CMA CGM" /></a>
        </div>
        <div class="col-md-10">

        </div>
        <div class="col-md-1" style="padding-top:50px; padding-right:50px;">
            <asp:Button CssClass="btn btn-primary btn-block" runat="server" OnClick="Unnamed_Click" Text="Log Out" />
        </div>
        </div>
  <div class="container">

        
        <div class="navbar-brand">
            <img src="Content/img/cma-cgma-login-logo.png" alt="CMA CGM" />
        </div>
        <div class="card card-register mx-auto mt-2">
            <div class="card-header">Cargo Admin Portal</div>
            <div class="card-body">
                
                    <asp:ScriptManager runat="server" ID="scriptManager"></asp:ScriptManager>
                    <div class="form-group">
                        <label for="exampleInputtext1">Port of Load (POL):</label>
                        <asp:DropDownList runat="server" ID="ddl_Ports" class="selectpicker" OnSelectedIndexChanged="ddl_Ports_SelectedIndexChanged" data-show-subtext="true" data-live-search="true"></asp:DropDownList>
                        <%--<select runat="server" onchange="OptionSelected()" id="Port" class="selectpicker" data-show-subtext="true" data-live-search="true">
                            <option ></option>
                            <option data-subtext="Rep California">Tom Foolery</option>
                            <option data-subtext="Sen California">Bill Gordon</option>
                            <option data-subtext="Sen Massacusetts">Elizabeth Warren</option>
                            <option data-subtext="Rep Alabama">Mario Flores</option>
                            <option data-subtext="Rep Alaska">Don Young</option>
                            <option data-subtext="Rep California" disabled="disabled">Marvin Martinez</option>
                        </select>--%>
                    </div>
                    <div class="form-group">
                         <asp:Repeater runat="server" ID="rptr_queries">
                <HeaderTemplate>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label runat="server" Font-Bold="true" ClientIDMode="Static">Sr#</asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label runat="server"  Font-Bold="true" ClientIDMode="Static">Port</asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label runat="server" Font-Bold="true" ClientIDMode="Static">Lara Partner Code</asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label runat="server"  Font-Bold="true" ClientIDMode="Static">Booking Reference</asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label runat="server"  Font-Bold="true" ClientIDMode="Static" ID="Label1">Voyage</asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label runat="server"  Font-Bold="true" ClientIDMode="Static" ID="Label2">Download</asp:Label>
                                </div>

                            </div>
                        </li>
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-md-2">
                                <asp:Label runat="server" ClientIDMode="Static" ID="lbl_ranking"> <%#Container.ItemIndex+1 %></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label runat="server" ClientIDMode="Static" ID="lbl_UserName"><%# Eval("Name") %></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label runat="server" ClientIDMode="Static" ID="lbl_marks"><%# Eval("LaraPartnerCode") %></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label runat="server" ClientIDMode="Static" ID="lbl_time"> <%# Eval("BookingReference") %></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label runat="server" ClientIDMode="Static" ID="Label3"><%# Eval("Voyage") %></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:LinkButton ID="lb_downloadFile"  CommandName='<%# Eval("id") %>' OnClick="lb_downloadFile_Click" runat="server"><%# Eval("AttachedFilePath") %>
                                    </asp:LinkButton>
                            </div>

                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:Button ID="btn_bindData" CausesValidation="false" OnClick="btn_bindData_Click" runat="server"></asp:Button>

                


            </div>
        </div>

    </div>
         </form>
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
