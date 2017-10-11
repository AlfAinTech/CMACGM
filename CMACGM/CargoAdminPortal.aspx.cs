using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMACGM
{
    public partial class CargoAdminPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearFields();
            }
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        protected void ClearFields()
        {
            rptr_queries.DataSource = null;
            rptr_queries.DataBind();
        }
        protected void btn_bindData_Click(object sender, EventArgs e)
        {
            CMACGMEntities1 db = new CMACGMEntities1();
            string portName = Port.Value;
            //find port id
            CMACGM.Port selectedPort = new CMACGM.Port();
            if (db.Ports.Any(a => a.Name == portName)){
                selectedPort = db.Ports.Where(a => a.Name == portName).First();

            }
            if(selectedPort != null)
            {
                BindData(selectedPort.id);
            }
            
        }
        protected void BindData(int PortID)
        {
            CMACGMEntities1 db = new CMACGMEntities1();
            if (db.Queries.Any(a => a.PortID == PortID))
            {
                var queries = db.Queries.Where(a => a.PortID == PortID).Select(a => new { a.id,a.Port.Name, a.LaraPartnerCode, a.BookingReference, a.Voyage, a.AttachedFilePath }).ToList();
                rptr_queries.DataSource = queries;
                rptr_queries.DataBind();
            }
            else
            {
                rptr_queries.DataSource = null;
                rptr_queries.DataBind();
                
            }
            
        }

        protected void lb_downloadFile_Click(object sender, EventArgs e)
        {
            CMACGMEntities1 db = new CMACGMEntities1();


            LinkButton lb_download = (LinkButton)sender;
            int queryID = Convert.ToInt32(lb_download.CommandName);
            Query query = db.Queries.Where(a => a.id == queryID).First();
            string fileName = query.AttachedFilePath;
            string portName = query.Port.Name;

            // find path of this query id to download
            if (fileName != "")
            {
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + fileName);
                string filePath = CargoUtil.filePath+ portName+ "/" + fileName;
                Response.TransmitFile(filePath);
                Response.End();
            }
        }

       

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}