﻿using Lib;
using Lib.Entity;
using Lib.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;
using SalesMngmt.Utility;

namespace SalesMngmt.Configs
{
    public partial class Coa : MetroFramework.Forms.MetroForm
    {
        SaleManagerEntities db = null;
        List<COA_D> list = null;
        int compID = 0;

        public Coa(int cmpID)
        {
            InitializeComponent();
            db = new SaleManagerEntities();
            compID = cmpID;
        }

        public void LoadFuncaTion() {
            list = db.COA_D.AsNoTracking().Where(x=>x.CompanyID== compID).ToList();
            COABindingSource.DataSource = list;
            var listCOA = new List<COA_M>();
            listCOA.Add(new COA_M { CATitle = "Select", CAC_Code = 0 });
            listCOA.AddRange(db.COA_M.ToList());
            FillCombo(ddlCOA, listCOA, "CATitle", "CAC_Code", 0);

        }

        private void COA_Load(object sender, EventArgs e)
        {
            pnlMain.Hide();
            LoadFuncaTion();


        }

        private void lblAdd_Click(object sender, EventArgs e)
        {
            COABindingSource.AddNew();
            pnlMain.Show();
            GetDocCode("1");
            //LoadFuncaTion();
            txtCOA.Focus();
            cmbxCOA.Enabled = true;
            label3.Text = "ADD";
        }

        private void lblEdit_Click(object sender, EventArgs e)
        {
            COA_D obj = (COA_D)COABindingSource.Current;
            pnlMain.Show();
            txtCOA.Focus();
            GetDocCode(obj.CAC_Code.ToString());
            cmbxCOA.Enabled = false;
            label3.Text = "EDIT";
        }

        #region -- Global variables start --

        string docCode;

        #endregion -- Global variable end --

        private void btnCancel_Click(object sender, EventArgs e)
        {
            pnlMain.Hide();
            COA_D us = (COA_D)COABindingSource.Current;
            if (us.AC_Code == 0)
            {
                COABindingSource.RemoveCurrent();
            }
            else
            {
                cmbxCOA.Enabled = true;
                COABindingSource.Clear();
                var listcancel = db.COA_D.AsNoTracking().Where(x=>x.CompanyID==compID).ToList();
                COABindingSource.DataSource = listcancel;
            }
            }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtCOA.Text == "")
            { MessageBox.Show("Please Provide Name Type", "", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            else
            {
                COA_D obj = (COA_D)COABindingSource.Current;
                var code = Convert.ToInt32(cmbxCOA.SelectedValue);
                var Currentobj = db.COA_D.ToList().Find(x => x.AC_Title == txtCOA.Text.Trim()&&x.CAC_Code==code && x.CompanyID==compID);
                if (obj.CDID == 0)
                {
                    if (Currentobj != null)
                    {
                        MessageBox.Show("Coa Name Already Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }
                else
                {
                    bool isCodeExist = list.Any(record =>
                                         record.AC_Title == obj.AC_Title &&
                                         record.AC_Code != obj.AC_Code &&
                                         record.CompanyID==compID);
                    if (isCodeExist)
                    {
                        MessageBox.Show("Coa Name Already Exists", "Duplicate", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }
                var cac = (COA_M)cmbxCOA.SelectedItem;

                DataAccess access = new DataAccess();
                COA coa = new COA();
                String Inventorycode = "";
                coa.AC_Code = cac.CAC_Code;
                var con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                con.Open();
                var trans = con.BeginTransaction();
                Inventorycode = access.GetScalar("GetAc_Code", coa, con, trans);

                var guid = Guid.NewGuid().ToString();
                obj.AC_Title = txtCOA.Text.Trim();
                obj.InActive = chkIsActive.Checked;
                obj.CAC_Code = cac.CAC_Code;
                obj.PType_ID = 1;
                obj.ZID = 0;
                obj.CR =Convert.ToDouble( txtCredit.Text.DefaultZero());
                obj.DR = Convert.ToDouble(txtDebit.Text.DefaultZero());
                obj.Qty = Convert.ToDouble(txtQuantity.Text.DefaultZero());
                obj.CompanyID = compID;

                //obj.crtBy = "";
                //obj.crtDate = DateTime.Now;
                //obj.CompanyID = compID;
                if (obj.CDID == 0)
                {
                    obj.AC_Code = Convert.ToInt32(Inventorycode);
                    db.COA_D.Add(obj);
                }
                else
                {
                    var result = db.COA_D.SingleOrDefault(b => b.AC_Code == obj.AC_Code && b.CompanyID == compID);
                    if (result != null)
                    {
                        result.AC_Title = txtCOA.Text.Trim();
                        result.InActive = chkIsActive.Checked;
                        result.PType_ID = 1;
                        result.ZID = 0;
                        result.CR = Convert.ToDouble(txtCredit.Text.DefaultZero());
                        result.DR = Convert.ToDouble(txtDebit.Text.DefaultZero());
                        result.Qty = Convert.ToDouble(txtQuantity.Text.DefaultZero());

                    }
                }
                db.SaveChanges();
                pnlMain.Hide();
            }
        }
        private void CoaDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            COADataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
        }

        #region -- Helper Method Start --
        public void GetDocCode(string selected)
        {
            cmbxCOA.DataSource = db.COA_M.ToList();
            cmbxCOA.ValueMember = "CAC_Code";
            cmbxCOA.DisplayMember = "CATitle";
            cmbxCOA.SelectedIndex = Convert.ToInt32(selected) - 1;
        }
        public void FillCombo(ToolStripComboBox comboBox, object obj, String Name, String ID, int selected = 1)
        {
            comboBox.ComboBox.DataSource = obj;
            comboBox.ComboBox.DisplayMember = Name; // Column Name
            comboBox.ComboBox.ValueMember = ID;  // Column Name
            comboBox.ComboBox.SelectedValue = selected;
        }

        private void toolStripTextBoxFind_Leave(object sender, EventArgs e)
        {
            try
            {
                if (toolStripTextBoxFind.Text.Trim().Length == 0) { COADataGridView.DataSource = list; }
                else
                {
                    COADataGridView.DataSource = list.FindAll(x => x.AC_Title.ToLower().Contains(toolStripTextBoxFind.Text.ToLower().Trim()));
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        //
        #endregion -- Helper Method End --

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void ddlCOA_SelectedIndexChanged(object sender, EventArgs e)
        {
            var ddl = (COA_M)ddlCOA.SelectedItem;
            if (ddl.CAC_Code == 0)
            {
                list = db.COA_D.AsNoTracking().Where(x=>x.CompanyID==compID).ToList();
                COABindingSource.DataSource = list;
            }
            else
            {
                list = db.COA_D.Where(x => x.CAC_Code == ddl.CAC_Code && x.CompanyID==compID).ToList();
                COABindingSource.DataSource = list;
            }
        }

        private void txtDebit_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as MetroFramework.Controls.MetroTextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void txtCredit_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as MetroFramework.Controls.MetroTextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void txtQuantity_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // only allow one decimal point
            if ((e.KeyChar == '.') && ((sender as MetroFramework.Controls.MetroTextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }
    }
}
