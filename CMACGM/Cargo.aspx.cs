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
            }
        }
        protected void ClearFields()
        {
            tb_BookingRef.Text = "";
            tb_LaraPartnerCode.Text = "";
            tb_LaraPartnerCode.Text = "";
            fileUploader.Attributes.Clear();
            Port.Value="";

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
            if (Port.Value != "")
            {
                //find port id
                CMACGM.Port selectedPort = new CMACGM.Port();
                if (db.Ports.Any(a => a.Name == Port.Value))
                {
                    selectedPort = db.Ports.Where(a => a.Name == Port.Value).First();
                }
                newData.Port = selectedPort;

                if (fileUploader.HasFile)
                {

                    try
                    {
                        string filename = Path.GetFileName(fileUploader.FileName);
                        string filePath = CargoUtil.filePath+Port.Value+"/" ;
                        bool exists = System.IO.Directory.Exists(filePath);
                        if (!exists)
                        {
                            System.IO.Directory.CreateDirectory(filePath);
                        }
                        fileUploader.SaveAs(filePath + filename);
                        newData.AttachedFilePath = filename;
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Upload status: File uploaded!');", true);

                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Upload status: The file could not be uploaded. The following error occured: '" + ex.Message + "');", true);

                    }


                }
                try
                {
                    newData.UserID = 1.ToString();
                    db.Queries.Add(newData);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Upload status: The file could not be uploaded. The following error occured: '" + ex.Message + "');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "text", "alert('Select Port');", true);
            }
            //save in database
            //clear fields
            ClearFields();
        }
    }
    
}