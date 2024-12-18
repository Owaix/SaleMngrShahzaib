﻿using Lib.Entity;
using Lib.Reporting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace SalesMngmt.Reporting
{
    public partial class paidCustomerByMonth : MetroFramework.Forms.MetroForm
    {
        SaleManagerEntities db = null;
        List<Lib.Entity.RecivedVoucharIndex_Result> list = null;
        int compID = 0;
        int obj = 0;
        int AcCode = 0;
        double Amt = 0;
        DateTime dt = DateTime.Now;
        int ChkNO = 0;
        int Narr = 0;
        int CustomerCode = 0;




        public paidCustomerByMonth(int _compID)
        {
            InitializeComponent();
            compID = _compID;
            db = new SaleManagerEntities();
        }


        private void Category_Load(object sender, EventArgs e)
        {

            //cat type = new cat();
            //DataAccess access = new DataAccess();
            //type.PType_ID = 1;
            //var con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            //con.Open();
            //SqlTransaction trans = con.BeginTransaction();
            //var objcat = access.Get<cat>("Sp_cat_Select", type, con, trans);
            var vendorCount = db.Vendors.Where(x => x.CompanyID == 0).FirstOrDefault();
            var AccountCount = db.COA_D.Where(x => x.CAC_Code == 1).FirstOrDefault();

            //  FillCombo(cmbxAccount, db.COA_D.Where(x => x.CAC_Code == 1).ToList(), "AC_Title", "AC_Code", AccountCount.AC_Code);

            // var MyNewDateValue = DateTime.Today.AddDays(-10);

        }
        public void FillCombo(ComboBox comboBox, object obj, String Name, String ID, int selected)
        {
            comboBox.DataSource = obj;
            comboBox.DisplayMember = Name; // Column Name
            comboBox.ValueMember = ID;  // Column Name
            comboBox.SelectedValue = selected;
        }

        private void lblAdd_Click(object sender, EventArgs e)
        {

        }

        private void lblEdit_Click(object sender, EventArgs e)
        {




        }

        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --


        private void btnCancel_Click(object sender, EventArgs e)
        {

        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}



        private void btnSave_Click(object sender, EventArgs e)
        {

        }
        private void catDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            CategorysDataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        #region -- Helper Method Start --
        public void GetDocCode()
        {
            //catList obj = new catList(new cat { }.Select());
            //docCode = "DOC-" + (obj.Count + 1);
        }

        private void toolStripTextBoxFind_Leave(object sender, EventArgs e)
        {
            try
            {
                //if (toolStripTextBoxFind.Text.Trim().Length == 0) { CategorysDataGridView.DataSource = list; }
                //else
                //{
                //    // CategorysDataGridView.DataSource = list.FindAll(x => x.ArticleType1.ToLower().Contains(toolStripTextBoxFind.Text.ToLower().Trim()));
                //}
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        //
        #endregion -- Helper Method End --

        private void CategorysDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //  var abc=   CategorysDataGridView.Rows[e.RowIndex].Cells[0].Value;
        }

        private void CategorysDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {



        }

        private void pnlMain_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            CategorysDataGridView.Rows.Clear();

            var month = dtTo.Value.Month;
            var year = dtTo.Value.Year;
            var rows = ReportsController.GetPaidCustomerByMonth(month, year);

            var abc = rows.AsEnumerable().Select(i => new
            {
                ToDate = Convert.ToDateTime(i["ToDate"]),
                FromDate = Convert.ToDateTime(i["FromDate"])
            }).FirstOrDefault();

            // var abc = db.getMonthDays(month, year).FirstOrDefault();
            var To = abc.ToDate;
            var From = abc.FromDate;
            rows = ReportsController.GetPaidCustomerByMonth(From, To, compID);
            var getRecord = rows.AsEnumerable().Select(i => new
            {
                CusName = i["CusName"].ToString(),
                TOTAL_AMOUNT = Convert.ToDecimal(i["TOTAL AMOUNT"]),
                AC_Code = i["AC_Code"].ToString()
            }).ToList();

            //var getRecord = db.getPaidRecordByMonth(To, From).ToList();
            var count = getRecord.Count();

            for (int b = 0; b < count; b++)
            {
                //var abc = new MyModels.VendorLedger();
                int Acode = Convert.ToInt32(getRecord[b].AC_Code);
                var customer = db.Customers.Where(x => x.AC_Code == Acode).FirstOrDefault();
                var PerMonth = customer.CollectPerMonth;
                var remaingAmount = PerMonth - Convert.ToInt32(getRecord[b].TOTAL_AMOUNT);
                CategorysDataGridView.Rows.Add(getRecord[b].CusName, PerMonth, getRecord[b].TOTAL_AMOUNT, remaingAmount);
            }
        }
    }



    //{
    //    public paidCustomerByMonth()
    //    {
    //        InitializeComponent();
    //    }
    //}
}
