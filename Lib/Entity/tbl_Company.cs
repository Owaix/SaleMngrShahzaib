//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Lib.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Company
    {
        public int CompID { get; set; }
        public string Comp { get; set; }
        public string CShort { get; set; }
        public string Address { get; set; }
        public string Tel { get; set; }
        public string Eml { get; set; }
        public Nullable<bool> isDelete { get; set; }
        public Nullable<int> companyID { get; set; }
    }
}
