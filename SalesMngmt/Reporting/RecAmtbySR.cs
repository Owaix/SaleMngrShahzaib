using Lib.Entity;
using Lib.Model;
using Lib.Reporting;
using Lib.Utilities;
using Microsoft.Reporting.WinForms;
using SalesMngmt.Invoice;
using SalesMngmt.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace SalesMngmt.Reporting
{
    public partial class RecAmtbySR : Form
    {
        //public CustomerLedgerSummary()
        //{
        //    InitializeComponent();
        //}

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
        int screenId = 0;

        public RecAmtbySR(int _compID)
        {
            InitializeComponent();
            compID = _compID;
            screenId = 0;
            db = new SaleManagerEntities();
        }

        private void Category_Load(object sender, EventArgs e)
        {
            List<tbl_Employee> Employe = new List<tbl_Employee>();
            Employe.Add(new tbl_Employee { ID = 0, EmployeName = "--Select--" });
            Employe.AddRange(db.tbl_Employee.Where(x => x.companyID == compID && x.isDeleted == false).ToList());
            FillCombo(cmbxSalesPerson, Employe, "EmployeName", "ID", 0);

            List<CustomerList> customerList = new List<CustomerList>();
            customerList.Add(new CustomerList { AC_Code = 0, Name = "--SELECT--" });
            var aa = ReportsController.getcustumerList(compID);
            foreach (DataRow row in aa.Rows)
            {
                customerList.Add(new CustomerList { AC_Code = (int)row["AC_Code"], Name = row["Name"] + "/" + row["city"] + "/" + row["AC_Code"] });
            }
            FillCombo(cmbxCustomer, customerList, "Name", "AC_Code", 0);
        }

        public void FillCombo(ComboBox comboBox, object obj, String Name, String ID, int selected)
        {
            comboBox.DataSource = obj;
            comboBox.DisplayMember = Name; // Column Name
            comboBox.ValueMember = ID;  // Column Name
            comboBox.SelectedValue = selected;
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



            }



        }

        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --


        private void btnCancel_Click(object sender, EventArgs e)
        {

            //  Lib.Entity.ArticleType us = (Lib.Entity.ArticleType)articleTypeBindingSource.Current;
            obj = 0;
            if (obj == 0)
            {

            }
        }

        //public void alluser(string username)
        //{
        //    lblUserName.Text = username;
        //}




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
            if (e.ColumnIndex == 9)
            {
                int typecode = Convert.ToInt32(CategorysDataGridView.Rows[e.RowIndex].Cells[7].Value);

                int rid = Convert.ToInt32(CategorysDataGridView.Rows[e.RowIndex].Cells[8].Value);

                if (typecode == 2)
                {

                    Invoice.PInv pinv = new Invoice.PInv(0);
                    pinv.Show();

                    EditMessageBox messageBox = new EditMessageBox(pinv, compID, "PI");

                    var purM = db.Pur_M.Where(x => x.RID == rid).FirstOrDefault();
                    messageBox.purchaseEdit(purM.InvNo);

                }


                else if (typecode == 3)
                {



                }

                else if (typecode == 5)
                {


                    Invoice.SInv pinv = new Invoice.SInv(0);
                    pinv.Show();

                    EditMessageBox messageBox = new EditMessageBox(pinv, compID, "PI");

                    var purM = db.Sales_M.Where(x => x.RID == rid).FirstOrDefault();
                    messageBox.purchaseEdit(purM.InvNo);


                }

                else if (typecode == 6)
                {


                }

                else if (typecode == 14)
                {

                    Invoice.ReceiveVoucher pinv = new Invoice.ReceiveVoucher(0);
                    pinv.Show();
                    pinv.received(rid);
                }

                else if (typecode == 15)
                {


                    Invoice.PaymentVoucher pinv = new Invoice.PaymentVoucher(0);
                    pinv.Show();
                    pinv.Payment(rid);


                }

                else if (typecode == 16)
                {

                }
            }
        }

        private void pnlMain_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            //CategorysDataGridView.Rows.Clear();
            int Itemid = Convert.ToInt32(cmbxSalesPerson.SelectedValue);
            if (Itemid > 0)
            {
                string Query = "select c.CusName , c.CityName , c.AC_Code ,  SUM(d.Amt) as Amt , balance from RV_M m " +
                               "inner join RV_D d ON m.RID = d.RID " +
                               "left join(select c.CusName , ISNULL(ct.[CityName],'') as [CityName] , c.AC_Code from[dbo].[Customers] c left join[dbo].[tbl_city] ct on c.City = ct.Id) AS c ON c.AC_Code = d.AC_Code " +
                               "inner join (SELECT isnull(SUM(debit),0) - ISNULL(sum(Credit),0) as balance , AC_Code FROM GL WHERE CAST(GLDate as Date) < CAST(GETDATE() as Date) group by AC_Code) as tbl1 on tbl1.AC_Code = c.AC_Code " +
                               "where m.CompID = @CompID AND SID = @SID and (c.AC_Code = @Customer OR @Customer = 0)" +
                               "group by c.CusName , c.CityName , c.AC_Code , balance";

                SqlConnection con = new SqlConnection(ConnectionStrings.GetCS);
                SqlCommand cmd = new SqlCommand(Query, SqlHelper.DefaultSqlConnection);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("@Customer", SqlDbType.Int).Value = (int)cmbxCustomer.SelectedValue;
                cmd.Parameters.Add("@SID", SqlDbType.Int).Value = (int)cmbxSalesPerson.SelectedValue;
                cmd.Parameters.Add("@CompID", SqlDbType.Int).Value = compID;
                var rows = SqlHelper.ExecuteDataset(cmd).Tables[0];
                CategorysDataGridView.DataSource = rows;
                // object sumObject;
                // sumObject = rows.Compute("Sum(Amt)", string.Empty);
                // label1.Text = "Total : " + sumObject;
                //       CategorysDataGridView.Rows.Add("", "", "Total", sumObject, "", "");
            }
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            if (CategorysDataGridView.Rows.Count == 0)
            {
                MessageBox.Show("Table is empty ");
                return;


            }

            int a = 0;
            List<KarahiReceipt> orderList = new List<KarahiReceipt>();
            foreach (DataGridViewRow row in CategorysDataGridView.Rows)
            {
                KarahiReceipt orders = new KarahiReceipt();

                orders.SNO = ++a;
                orders.ItemNAme = row.Cells[1].Value.ToString();

                orders.item = row.Cells[1].Value.ToString();
                orders.Note = row.Cells[2].Value.ToString();
                orders.Total = Convert.ToDouble(row.Cells[3].Value.ToString());
                orderList.Add(orders);

            }


            Silent silent = new Silent();
            ReportViewer reportViewer1 = new ReportViewer();


            silent.Run(reportViewer1, orderList, "SalesMngmt.ThermalReport.Item_List.rdlc");

            CategorysDataGridView.Rows.Clear();
        }
    }
}
