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
    
    public partial class getItemAdjustment_Result
    {
        public Nullable<System.DateTime> EDate { get; set; }
        public string Account { get; set; }
        public int AccountID { get; set; }
        public string product { get; set; }
        public Nullable<int> productCode { get; set; }
        public int productID { get; set; }
        public string warehouse { get; set; }
        public int warehouseID { get; set; }
        public int RID { get; set; }
        public Nullable<double> QtyIN { get; set; }
        public Nullable<double> QtyOut { get; set; }
        public Nullable<double> PurPrice { get; set; }
        public Nullable<double> Debit { get; set; }
        public Nullable<double> Credit { get; set; }
    }
}
