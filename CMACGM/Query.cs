//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CMACGM
{
    using System;
    using System.Collections.Generic;
    
    public partial class Query
    {
        public int id { get; set; }
        public string UserID { get; set; }
        public int PortID { get; set; }
        public string LaraPartnerCode { get; set; }
        public string BookingReference { get; set; }
        public string Voyage { get; set; }
        public string AttachedFilePath { get; set; }
        public Nullable<System.DateTime> SubmittedOn { get; set; }
        public Nullable<bool> IsResolved { get; set; }
        public string ResolvedBy { get; set; }
        public Nullable<System.DateTime> ResolvedOn { get; set; }
    
        public virtual Port Port { get; set; }
    }
}
