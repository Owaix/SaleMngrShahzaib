﻿using Lib.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace SalesMngmt.Invoice
{
    public partial class CustomerVendor : MetroFramework.Forms.MetroForm
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

        public CustomerVendor(int _compID)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
            compID = _compID;
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
            var CustomerCount = db.Customers.Where(x => x.CompanyID == compID).FirstOrDefault();
            // var AccountCount = db.COA_D.Where(x => x.CAC_Code == 1).FirstOrDefault();
            FillCombo(cmbxVendor, db.Customers.Where(x => x.CompanyID == compID).ToList(), "CusName", "AC_Code", CustomerCount.AC_Code);
            //  FillCombo(cmbxAccount, db.COA_D.Where(x => x.CAC_Code == 1).ToList(), "AC_Title", "AC_Code", AccountCount.AC_Code);

            pnlMain.Hide();
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
            clear();
            pnlMain.Show();
            GetDocCode();
            // txtChkNo.Focus();
            label3.Text = "ADD";
            obj = 0;
        }

        private void lblEdit_Click(object sender, EventArgs e)
        {
            if (obj == 0)
            {
                MessageBox.Show("Select any row first");
            }
            else
            {
                //var tbl = db.Articles.Where(x => x.ProductID == obj).FirstOrDefault();

                ////txtArticalNo.Text = tbl.ArticleNo;
                //txtChkNo.Text = tbl.ProductName;
                //cmbxAccount.SelectedValue = tbl.ArticleTypeID;
                //cmbxCustomer.SelectedValue = tbl.StyleID;
                //chkIsActive.Checked = (bool)tbl.IsDelete;


                pnlMain.Show();
                //txtChkNo.Focus();
                label3.Text = "EDIT";
            }



        }

        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --


        private void btnCancel_Click(object sender, EventArgs e)
        {
            pnlMain.Hide();
            //  Lib.Entity.ArticleType us = (Lib.Entity.ArticleType)articleTypeBindingSource.Current;
            obj = 0;
            if (obj == 0)
            {
                clear();
                list = db.RecivedVoucharIndex(dtTo.Value, dtFrom.Value).ToList();
                recivedVoucharIndexResultBindingSource.DataSource = list;
            }
        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}

        public void clear()
        {
            txtNarr.Text = "";
            txtChkNo.Text = "";
            dtTranscation.Value = DateTime.Now;
            var customerCount = db.Customers.Where(x => x.CompanyID == compID).FirstOrDefault();
            var AccountCount = db.COA_D.Where(x => x.CAC_Code == 1).FirstOrDefault();
            FillCombo(cmbxCustomer, db.Customers.Where(x => x.CompanyID == compID).ToList(), "CusName", "AC_Code", customerCount.AC_Code);
            FillCombo(cmbxAccount, db.COA_D.Where(x => x.CAC_Code == 1).ToList(), "AC_Title", "AC_Code", 0 /*AccountCount.AC_Code*/);

            dtCheckDate.Value = DateTime.Now;
            //chkIsActive.Checked = false;
            txtAmount.Text = "";
        }

        private void btnSave_Click(object sender, EventArgs e)
        {/*txtArticalNo.Text == ""*/
            int code = Convert.ToInt32(cmbxAccount.SelectedValue);
            int customer = Convert.ToInt32(cmbxCustomer.SelectedValue);

            if (obj == 0)
            {
                var id = db.sp_RV_M_Insert(0, dtTranscation.Value, code, 0, "0").FirstOrDefault();
                db.sp_RV_D_Insert(Convert.ToInt32(id), txtNarr.Text, 7, customer, 1, Convert.ToInt32(txtChkNo.Text), 1, 0, Convert.ToDouble(txtAmount.Text), 0, 0, 0, 0, dtCheckDate.Value);// int a = Convert.ToInt32(id);

                db.sp_RV_GL_credit(14, code, customer, txtNarr.Text, Convert.ToDouble(txtAmount.Text), 0, Convert.ToInt32(id), dtTranscation.Value);
                db.sp_RV_GL_Debit(14, customer, code, txtNarr.Text, 0, Convert.ToDouble(txtAmount.Text), Convert.ToInt32(id), dtTranscation.Value);

            }
            else
            {

                db.sp_RV_M_Update(0, dtCheckDate.Value, code, 0, "", obj);
                db.sp_RV_D_Update(obj, txtNarr.Text, 7, customer, 1, Convert.ToInt32(txtChkNo.Text), 1, 0, Convert.ToDouble(txtAmount.Text), 0, 0, 0, 0, dtCheckDate.Value);

                var all = db.GL.Where(x => x.TypeCode == 14 && x.RID == obj);
                db.GL.RemoveRange(all);
                db.SaveChanges();

                GL gl = new GL();
                gl.TypeCode = 14;
                gl.AC_Code = code;
                gl.AC_Code2 = customer;
                gl.Narration = txtNarr.Text;
                gl.Debit = Convert.ToDouble(txtAmount.Text);
                gl.Credit = 0;
                gl.RID = obj;
                gl.CompID = compID;
                gl.GLDate = dtCheckDate.Value;
                gl.MOP_ID = 7;
                db.GL.Add(gl);

                GL gl2 = new GL();
                gl2.TypeCode = 14;
                gl2.AC_Code = customer;
                gl2.AC_Code2 = code;
                gl2.Narration = txtNarr.Text;
                gl2.Debit = 0;
                gl.CompID = compID;
                gl2.Credit = Convert.ToDouble(txtAmount.Text);
                gl2.RID = obj;
                gl2.GLDate = dtCheckDate.Value;
                gl2.MOP_ID = 7;
                db.GL.Add(gl2);

                db.SaveChanges();

            }
            list = db.RecivedVoucharIndex(dtTo.Value, dtFrom.Value).ToList();
            recivedVoucharIndexResultBindingSource.DataSource = list;

            //    if (true)
            //    { MessageBox.Show("Please Provide ArticleNo", "", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            //    else
            //    {
            //        // Lib.Entity.ArticleType obj = (Lib.Entity.ArticleType)articleTypeBindingSource.Current;

            //      //  var Currentobj = db.Articles.ToList().Find(x => x.ArticleNo == txtArticalNo.Text.Trim());// list.Find(x => x.Name == txtcat.Text.Trim());
            //        if (obj == 0)
            //        {/*Currentobj != null*/
            //            if (true)
            //            {
            //                MessageBox.Show("Artical Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //                return;
            //            }
            //        }
            //        else
            //        {
            //            var articalTbl = db.Articles.Where(x => x.ProductID == obj).FirstOrDefault();
            //            //bool isCodeExist = db.Articles.Any(record =>
            //            //                     record.ArticleNo == //txtArticalNo.Text &&
            //            //                     record.ProductID != articalTbl.ProductID);
            //            //if (isCodeExist)
            //            //{
            //            //    MessageBox.Show("Artical Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //            //    return;
            //            //}
            //        }

            //        Article ar = new Article();

            //        ar.ArticleTypeID = Convert.ToInt32(cmbxAccount.SelectedValue);//txtcat.Text.Trim();
            //        ar.StyleID = Convert.ToInt32(cmbxCustomer.SelectedValue);
            //        ar.ProductName = txtName.Text;
            //     //   ar.ArticleNo = txtArticalNo.Text;
            //        ar.IsDelete = chkIsActive.Checked;

            //        if (obj == 0)
            //        {
            //            db.Articles.Add(ar);
            //        }
            //        else
            //        {

            //            var articalTbl = db.Articles.Where(x => x.ProductID == obj).FirstOrDefault();

            //            var result = db.Articles.SingleOrDefault(b => b.ProductID == articalTbl.ProductID);
            //            if (result != null)
            //            {


            //                result.ArticleTypeID = Convert.ToInt32(cmbxAccount.SelectedValue);//txtcat.Text.Trim();
            //                result.StyleID = Convert.ToInt32(cmbxCustomer.SelectedValue);
            //                result.ProductName = txtName.Text;
            //               // result.ArticleNo = txtArticalNo.Text;
            //                result.IsDelete = chkIsActive.Checked;

            //            }
            //        }
            //        db.SaveChanges();
            pnlMain.Hide();
            //        obj = 0;
            //        list = db.RecivedVoucharIndex().ToList();
            //        spgetArticleResultBindingSource.DataSource = list;

            //        //list = db.ArticleTypes.ToList();
            //        //articleTypeBindingSource.DataSource = list;
            //    }
            clear();
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

            obj = Convert.ToInt32(CategorysDataGridView.Rows[e.RowIndex].Cells[0].Value);
            dtTranscation.Value = Convert.ToDateTime(CategorysDataGridView.Rows[e.RowIndex].Cells[2].Value.ToString());
            cmbxAccount.SelectedValue = Convert.ToInt32(CategorysDataGridView.Rows[e.RowIndex].Cells[3].Value);
            txtAmount.Text = Convert.ToDouble(CategorysDataGridView.Rows[e.RowIndex].Cells[16].Value).ToString();
            dtCheckDate.Value = Convert.ToDateTime(CategorysDataGridView.Rows[e.RowIndex].Cells[20].Value.ToString());
            txtChkNo.Text = Convert.ToInt32(CategorysDataGridView.Rows[e.RowIndex].Cells[21].Value).ToString();
            txtNarr.Text = Convert.ToInt32(CategorysDataGridView.Rows[e.RowIndex].Cells[25].Value).ToString();
            cmbxCustomer.SelectedValue = Convert.ToInt32(CategorysDataGridView.Rows[e.RowIndex].Cells[29].Value);



        }

        private void pnlMain_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            CategorysDataGridView.Rows.Clear();
            //CategorysDataGridView.Rows.Add(1, 2, 3, 4, 5, 6, 7);
            int Vendorcode = Convert.ToInt32(cmbxVendor.SelectedValue);

            var previosBalance = db.getCustomerPreviousBalance(dtTo.Value, Vendorcode).FirstOrDefault();
            int a = 1;

            double credit = previosBalance.credit;
            double debit = previosBalance.debit;
            double balance = debit - credit;
            if (balance != 0)
            {
                //var abc = new MyModels.VendorLedger();
                //abc.Credit = (float)credit;
                //abc.Debit = (float)debit;
                //abc.Balance = (float)balance;
                //abc.Naration = "Previous Balance";
                CategorysDataGridView.Rows.Add(a, "", "", debit, credit, balance, "Previous Balance");
                a++;
            }
            SaleManagerEntities db1 = new SaleManagerEntities();

            var getdata = db.getCustomerLedgerBYDate(dtTo.Value, dtFrom.Value, Vendorcode).ToList();//db.getVendorLedgerBYDate(dtTo.Value, dtFrom.Value,;


            var count = getdata.Count();



            for (int b = 0; b < count; b++)
            {
                // var abc = new MyModels.VendorLedger();

                balance = balance - (double)getdata[b].credit;
                balance = balance + (double)getdata[b].debit;

                //getdata[a].abc.Balance = 0;
                //abc.Credit = (float)getdata[a].credit;
                //abc.Debit = (float)getdata[a].debit;
                //abc.GlDate = (DateTime)getdata[a].GLDate;
                //abc.Naration = getdata[a].Narration;
                //abc.Reference = getdata[a].reference;
                //abc.SNO = a;
                //abc.Balance = (float)balance;

                CategorysDataGridView.Rows.Add(a, (DateTime)getdata[b].GLDate, getdata[b].reference, (float)getdata[b].debit, (float)getdata[b].credit, (float)balance, getdata[b].Narration);
                a++;

                //studentList.Add(abc);
            }



            //list = db.RecivedVoucharIndex(dtTo.Value, dtFrom.Value).ToList();
            //recivedVoucharIndexResultBindingSource.DataSource = list;













        }


        public void customerledger(int code)
        {

            CategorysDataGridView.Rows.Clear();
            //CategorysDataGridView.Rows.Add(1, 2, 3, 4, 5, 6, 7);
            cmbxVendor.SelectedValue = Convert.ToInt32(code);
            dtTo.Value = DateTime.Today.AddDays(-10);
            dtFrom.Value = DateTime.Now;
            var previosBalance = db.getCustomerPreviousBalance(DateTime.Now, code).FirstOrDefault();
            int a = 1;

            double credit = previosBalance.credit;
            double debit = previosBalance.debit;
            double balance = debit - credit;
            if (balance != 0)
            {
                //var abc = new MyModels.VendorLedger();
                //abc.Credit = (float)credit;
                //abc.Debit = (float)debit;
                //abc.Balance = (float)balance;
                //abc.Naration = "Previous Balance";
                CategorysDataGridView.Rows.Add(a, "", "", debit, credit, balance, "Previous Balance");
                a++;
            }
            SaleManagerEntities db1 = new SaleManagerEntities();

            var getdata = db.getCustomerLedgerBYDate(DateTime.Now.AddDays(-10), dtFrom.Value, code).ToList();//db.getVendorLedgerBYDate(dtTo.Value, dtFrom.Value,;


            var count = getdata.Count();



            for (int b = 0; b < count; b++)
            {
                // var abc = new MyModels.VendorLedger();

                balance = balance - (double)getdata[b].credit;
                balance = balance + (double)getdata[b].debit;

                //getdata[a].abc.Balance = 0;
                //abc.Credit = (float)getdata[a].credit;
                //abc.Debit = (float)getdata[a].debit;
                //abc.GlDate = (DateTime)getdata[a].GLDate;
                //abc.Naration = getdata[a].Narration;
                //abc.Reference = getdata[a].reference;
                //abc.SNO = a;
                //abc.Balance = (float)balance;

                CategorysDataGridView.Rows.Add(a, (DateTime)getdata[b].GLDate, getdata[b].reference, (float)getdata[b].debit, (float)getdata[b].credit, (float)balance, getdata[b].Narration);
                a++;



            }
        }


        // {
        //    public CustomerVendor()
        //    {
        //        InitializeComponent();
        //    }
        //}
    }
}
