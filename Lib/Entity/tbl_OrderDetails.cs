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
    
    public partial class tbl_OrderDetails
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public string KOTID { get; set; }
        public Nullable<int> itemID { get; set; }
        public Nullable<decimal> Qty { get; set; }
        public Nullable<decimal> Rate { get; set; }
        public Nullable<int> CatID { get; set; }
        public string itemDtl { get; set; }
        public Nullable<decimal> disc { get; set; }
        public string itemName { get; set; }
    }
}
