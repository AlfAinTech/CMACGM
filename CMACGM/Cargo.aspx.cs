using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMACGM
{
    public partial class Cargo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearFields();
                FillData();
            }
            LogInHyperLink.NavigateUrl = "Login";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            // OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                LogInHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }
        protected void ClearFields()
        {
            tb_BookingRef.Text = "";
            tb_LaraPartnerCode.Text = "";
            tb_Voyage.Text = "";
            fileUploader.Attributes.Clear();
            ddl_Ports.SelectedIndex = 0;

        }
        protected void FillData()
        {
            CMACGMEntities1 db = new CMACGMEntities1();
            if (db.Ports.Any())
            {
                var ports = db.Ports.ToList();
                var newData = from x in ports select new { x.id, x.Name, x.Location, Port = String.Format("{0} {1}", x.Name, x.Location) };
                ddl_Ports.DataSource = newData;
                ddl_Ports.DataTextField = "Port";
                ddl_Ports.DataValueField = "Name";
                ddl_Ports.DataBind();
                ddl_Ports.Items.Insert(0, new ListItem("--Select Port--","0"));
                ddl_Ports.SelectedIndex = 0;
            }
            else
            {
                ddl_Ports.DataSource = null;
                ddl_Ports.DataBind();
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            CMACGMEntities1 db = new CMACGMEntities1();
            //check validations
            Query newData = new Query();
            if(tb_BookingRef.Text != "")
            {
                newData.BookingReference = tb_BookingRef.Text;
            }
            if(tb_LaraPartnerCode.Text != "")
            {
                newData.LaraPartnerCode = tb_LaraPartnerCode.Text;
            }
            if(tb_Voyage.Text != "")
            {
                newData.Voyage = tb_Voyage.Text;
            }
            if (ddl_Ports.SelectedIndex != 0 && ddl_Ports.SelectedValue != "")
            {
                //find port id
                if (tb_BookingRef.Text != "" && tb_LaraPartnerCode.Text != "" && tb_Voyage.Text != "" && fileUploader.HasFile)
                {
                    CMACGM.Port selectedPort = new CMACGM.Port();
                    if (db.Ports.Any(a => a.Name == ddl_Ports.SelectedValue))
                    {
                        selectedPort = db.Ports.Where(a => a.Name == ddl_Ports.SelectedValue).First();
                    }
                    newData.Port = selectedPort;

                    if (fileUploader.HasFile)
                    {
                        string Extension = Path.GetExtension(fileUploader.PostedFile.FileName);
                        if (Extension == ".png" && Extension == ".jpeg" && Extension == ".jpg" && Extension == ".txt" && Extension == ".TXT" && Extension == ".doc" && Extension == ".docx")
                        {
                            try
                            {
                                string filename = Path.GetFileName(fileUploader.FileName);
                                string filePath = CargoUtil.filePath + ddl_Ports.SelectedValue + "/";
                                bool exists = System.IO.Directory.Exists(filePath);
                                if (!exists)
                                {
                                    System.IO.Directory.CreateDirectory(filePath);
                                }
                                fileUploader.SaveAs(filePath + filename);
                                newData.AttachedFilePath = filename;
                                lbl_UploadStatus.Visible = true;
                                ClearFields();
                            }
                            catch (Exception ex)
                            {
                                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Upload status: The file could not be uploaded. Please try again');", true);

                            }
                        }
                        

                    }
                    try
                    {
                        newData.UserID = 1.ToString();
                        db.Queries.Add(newData);
                        db.SaveChanges();
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Form submitted successfully!');", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Something went wrong , Please try again!');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Please Select Port');", true);
            }
            
        }
    }
    
}