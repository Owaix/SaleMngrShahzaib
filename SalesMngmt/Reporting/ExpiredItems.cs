﻿using Lib.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SalesMngmt.Utility;
using Lib.Reporting;

namespace SalesMngmt.Reporting
{
    public partial class ExpiredItems : MetroFramework.Forms.MetroForm
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




        public ExpiredItems(int companyID)
        {
            InitializeComponent();

            db = new SaleManagerEntities();
            compID = companyID;
        }


        private void Category_Load(object sender, EventArgs e)
        {

            //cat type = new cat();
            //DataAccess access = new DataAccess();
            //type.PType_ID = 1;
            //var con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
            //con.Open();
            //SqlTransaction trans = con.BeginTransaction();
            ////var objcat = access.Get<cat>("Sp_cat_Select", type, con, trans);
            //var vendorCount = db.Vendors.Where(x => x.CompanyID == 0).FirstOrDefault();
            //var AccountCount = db.COA_D.Where(x => x.CAC_Code == 1).FirstOrDefault();
            //FillCombo(cmbxVendor, db.Vendors.Where(x => x.CompanyID == 0).ToList(), "VendName", "AC_Code", Convert.ToInt32(vendorCount.AC_Code));
            ////  FillCombo(cmbxAccount, db.COA_D.Where(x => x.CAC_Code == 1).ToList(), "AC_Title", "AC_Code", AccountCount.AC_Code);

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
            var ExpireItems = ReportsController.GetExpiredItems(dtTo.Value, dtFrom.Value,compID);
          
            int aa= ExpireItems.Rows.Count;
            if (aa == 0)
            {


                MessageBox.Show("NO Product is Expired in these dates");


            }

            else {
                int a = 1;

                foreach (DataRow rows in ExpireItems.Rows) {
                    CategorysDataGridView.Rows.Add(a, rows["IName"], rows["CTN"], rows["PCS"], rows["ExpDT"]);
                    a++;


                }
              


            }
        }
    }

    //public ExpiredItems()
    //{
    //    InitializeComponent();
    //}
}

