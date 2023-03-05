using DIagnoseMgmt;
using Lib.Entity;
using Lib.Model;
using Lib.Reporting;
using SalesMngmt.Utility;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SalesMngmt.Reporting
{
    public partial class ProductList : MetroFramework.Forms.MetroForm
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




        public ProductList(int comp)
        {
            InitializeComponent();

            db = new SaleManagerEntities();

            compID = comp;


            List<Item_Maker> article = new List<Item_Maker>();
            article.Add(new Item_Maker { MakerId = 0, Name = "--SELECT--" });
            article.AddRange(db.Item_Maker.Where(x => x.CompanyID == comp && x.IsDelete == false).ToList());
            FillCombo(cmbxCompany, article, "Name", "MakerId", 0);




        }


        private void Category_Load(object sender, EventArgs e)
        {



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
            int company = Convert.ToInt32(cmbxCompany.SelectedValue);

            if (company == 0)
            {


                var itemList = db.Items.AsNoTracking().Where(x => x.isDeleted == false && x.CompanyID == compID).ToList();
                int a = 1;
                foreach (var item in itemList)
                {
                    CategorysDataGridView.Rows.Add(false, a, item.IID, item.IName, item.SalesPrice, item.WholeSale, item.AveragePrice, item.CTN_PCK);
                    ++a;


                }




            }

            else
            {




                var itemList = db.Items.AsNoTracking().Where(x => x.isDeleted == false && x.CompanyID == compID && x.CompID == company).ToList();
                int a = 1;
                foreach (var item in itemList)
                {
                    CategorysDataGridView.Rows.Add(false, a, item.IID, item.IName, item.SalesPrice, item.WholeSale, item.AveragePrice, item.CTN_PCK);
                    ++a;



                }

            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                foreach (DataGridViewRow row in CategorysDataGridView.Rows)
                {
                    row.Cells["Update"].Value = checkBox1.Checked;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please Try Again", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in CategorysDataGridView.Rows)
            {
                var check = Convert.ToBoolean(row.Cells["Update"].Value);
                if (check)
                {
                    var ItemID = Convert.ToInt32(row.Cells["ID"].Value);
                    var items = db.Items.Where(x => x.IID == ItemID).FirstOrDefault();
                    items.SalesPrice = Convert.ToDouble(row.Cells["SalePrice"].Value.DefaultZero());
                    items.WholeSale = Convert.ToDecimal(row.Cells["WholeSale"].Value.DefaultZero());
                    items.AveragePrice = Convert.ToDouble(row.Cells["Average"].Value.DefaultZero());
                    items.CTN_PCK = Convert.ToDouble(row.Cells["ctn"].Value.DefaultZero());
                    db.Entry(items).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }

            CategorysDataGridView.Rows.Clear();
            int company = Convert.ToInt32(cmbxCompany.SelectedValue);

            if (company == 0)
            {


                var itemList = db.Items.AsNoTracking().Where(x => x.isDeleted == false && x.CompanyID == compID).ToList();
                int a = 1;
                foreach (var item in itemList)
                {
                    CategorysDataGridView.Rows.Add(false, a, item.IID, item.IName, item.SalesPrice, item.WholeSale, item.AveragePrice, item.CTN_PCK);
                    ++a;


                }




            }

            else
            {




                var itemList = db.Items.AsNoTracking().Where(x => x.isDeleted == false && x.CompanyID == compID && x.CompID == company).ToList();
                int a = 1;
                foreach (var item in itemList)
                {
                    CategorysDataGridView.Rows.Add(false, a, item.IID, item.IName, item.SalesPrice, item.WholeSale, item.AveragePrice, item.CTN_PCK);
                    ++a;



                }

            }
        }

        //    public Stock()
        //    {
        //        InitializeComponent();
        //    }
        //}
    }
}
